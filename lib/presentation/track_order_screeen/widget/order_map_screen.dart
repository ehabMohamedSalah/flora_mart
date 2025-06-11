import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';

class OrderMapScreen extends StatefulWidget {
  final OrderTrackerModel orderTrackerModel;
  
  const OrderMapScreen({Key? key, required this.orderTrackerModel}) : super(key: key);

  @override
  State<OrderMapScreen> createState() => _OrderMapScreenState();
}

class _OrderMapScreenState extends State<OrderMapScreen> {
  GoogleMapController? _mapController;
  Timer? _timer;
  
  // Starting position for the driver (will be updated from Firebase in real implementation)
  LatLng _driverPosition = const LatLng(24.7136, 46.6753); // Example coordinates
  
  // Destination position (customer location)
  final LatLng _destinationPosition = const LatLng(24.7255, 46.6468); // Example coordinates
  
  // Polyline coordinates representing the route
  final List<LatLng> _routeCoordinates = [
    const LatLng(24.7136, 46.6753), // Starting point
    const LatLng(24.7175, 46.6700),
    const LatLng(24.7200, 46.6650),
    const LatLng(24.7225, 46.6600),
    const LatLng(24.7255, 46.6468), // Destination point
  ];
  
  // Current position index in the route
  int _currentPositionIndex = 0;
  
  // Map markers and polylines
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _initializeMap();
    _startDriverAnimation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _mapController?.dispose();
    super.dispose();
  }

  void _initializeMap() {
    // Create the polyline for the route
    _polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        points: _routeCoordinates,
        color: Colors.pink,
        width: 5,
      ),
    );
    
    // Add destination marker
    _markers.add(
      Marker(
        markerId: const MarkerId('destination'),
        position: _destinationPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
        infoWindow: const InfoWindow(title: 'Destination'),
      ),
    );
    
    // Add initial driver marker
    _updateDriverMarker();
  }

  void _startDriverAnimation() {
    // Update driver position every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPositionIndex < _routeCoordinates.length - 1) {
        setState(() {
          _currentPositionIndex++;
          _driverPosition = _routeCoordinates[_currentPositionIndex];
          _updateDriverMarker();
          _animateToCurrentPosition();
        });
      } else {
        // Driver has reached destination
        timer.cancel();
      }
    });
  }

  void _updateDriverMarker() {
    // Remove old driver marker
    _markers.removeWhere((marker) => marker.markerId.value == 'driver');
    
    // Add updated driver marker
    _markers.add(
      Marker(
        markerId: const MarkerId('driver'),
        position: _driverPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(title: widget.orderTrackerModel.driverName ?? 'Driver'),
      ),
    );
  }

  void _animateToCurrentPosition() {
    _mapController?.animateCamera(
      CameraUpdate.newLatLngBounds(
        _getBounds(_routeCoordinates),
        50.0, // padding
      ),
    );
  }

  LatLngBounds _getBounds(List<LatLng> positions) {
    double minLat = positions.first.latitude;
    double maxLat = positions.first.latitude;
    double minLng = positions.first.longitude;
    double maxLng = positions.first.longitude;
    
    for (final position in positions) {
      if (position.latitude < minLat) minLat = position.latitude;
      if (position.latitude > maxLat) maxLat = position.latitude;
      if (position.longitude < minLng) minLng = position.longitude;
      if (position.longitude > maxLng) maxLng = position.longitude;
    }
    
    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track Order',
          style: AppTextStyle.medium18,
        ),
      ),
      body: Column(
        children: [
          // Driver info card
          if (widget.orderTrackerModel.driverName != null)
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    child: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.orderTrackerModel.driverName ?? 'Driver',
                          style: AppTextStyle.medium16,
                        ),
                        Text(
                          'Estimated arrival: ${widget.orderTrackerModel.estimatedArrival?.toString().substring(0, 16) ?? 'Soon'}',
                          style: AppTextStyle.medium14.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          // Map view
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _driverPosition,
                zoom: 14,
              ),
              markers: _markers,
              polylines: _polylines,
              onMapCreated: (controller) {
                _mapController = controller;
                _animateToCurrentPosition();
              },
              myLocationEnabled: false,
              compassEnabled: true,
              zoomControlsEnabled: true,
              mapType: MapType.normal,
            ),
          ),
        ],
      ),
    );
  }
}