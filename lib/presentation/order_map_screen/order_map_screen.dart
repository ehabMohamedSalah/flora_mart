import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/data/model/getSavedAddressResponce.dart';
import 'package:flora_mart/presentation/order_map_screen/view_model.dart/cubit/order_map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';
import 'package:latlong2/latlong.dart';

class OrderMapScreen extends StatefulWidget {
  final OrderTrackerModel orderTrackerModel;
  final AddressesModel address;

  const OrderMapScreen(
      {super.key, required this.orderTrackerModel, required this.address});

  @override
  State<OrderMapScreen> createState() => _OrderMapScreenState();
}

class _OrderMapScreenState extends State<OrderMapScreen> {
  ThemeData theme(BuildContext context) => Theme.of(context);
  MapController mapController = MapController(); // for scrolling in map
  // LocationData? currentLocation; // get current location
  // List<LatLng> routesPoints = []; // for draw line in map from start to end
  // List<Marker> markers = []; // for add markers in map
  // final String orsApiKey =
  //     "5b3ce3597851110001cf6248a7255b57b721401d9fb5f8c156423b8e"; // this key from website service (https://openrouteservice.org/) for return 2 routes points

  // @override
  // void initState() {
  //   super.initState();
  //   _initMap();
  // }

  // _initMap() async {
  //   await _getCurrentLocation();

  //   if (currentLocation != null) {
  //     _getRoute(const LatLng(29.988351, 31.229417));
  //   }
  // }

  // Future<void> _getCurrentLocation() async {
  //   var location = Location();
  //   try {
  //     var userLocation = await location.getLocation();
  //     setState(() {
  //       currentLocation = userLocation;
  //       markers.add(Marker(
  //         width: 80,
  //         height: 80,
  //         point: LatLng(userLocation.latitude!, userLocation.longitude!),
  //         child:
  //             const CustomMarkerWidget(label: "Appartment", icon: Icons.home),
  //       ));
  //     });
  //   } on Exception {
  //     currentLocation = null;
  //   }
  //   location.onLocationChanged.listen(
  //     (LocationData newLocation) {
  //       setState(() {
  //         currentLocation = newLocation;
  //       });
  //     },
  //   );
  // }

  // Future<void> _getRoute(LatLng destination) async {
  //   log('currentLocation: $currentLocation');

  //   if (currentLocation == null) return;
  //   log('currentLocation: $currentLocation');
  //   final start =
  //       LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
  //   final response = await http.get(Uri.parse(
  //       'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}'));
  //   if (response.statusCode == 200) {
  //     log("Success to get route");
  //     final data = json.decode(response.body);
  //     final List<dynamic> coords =
  //         data['features'][0]['geometry']['coordinates'];
  //     setState(() {
  //       routesPoints =
  //           coords.map((coord) => LatLng(coord[1], coord[0])).toList();
  //       markers.add(Marker(
  //           width: 80,
  //           height: 80,
  //           point: destination,
  //           child: CustomMarkerWidget(label: "Flowery", icon: Icons.store)));
  //     });
  //   } else {
  //     log("Error to get route");
  //   }
  // }

  // Future<void> _addDestinationMarker(LatLng point) async {
  //   await _getRoute(point);
  // }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.showmap,
          )),
      body: BlocConsumer<OrdermapCubit, OrdermapState>(
        listener: (context, state) {},
        builder: (context, state) {
          return FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(
                  double.parse(widget.address.lat ?? "0.0"),
                  double.parse(widget.address.long ??
                      "0.0")), // مركز الخريطة (مثلاً القاهرة)
              initialZoom: 15.0,
              // onTap: (tapPosition, point) => _addDestinationMarker(point),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.yourapp',
              ),
              if (OrdermapCubit.get(context).routesPoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: OrdermapCubit.get(context).routesPoints,
                      strokeWidth: 4,
                      color: theme(context).colorScheme.primary,
                    ),
                  ],
                ),
              MarkerLayer(markers: OrdermapCubit.get(context).markers),
            ],
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "zoom_in",
            mini: true,
            child: const Icon(Icons.zoom_in),
            onPressed: () {
              mapController.move(
                mapController.camera.center,
                mapController.camera.zoom + 1,
              );
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "zoom_out",
            mini: true,
            child: const Icon(Icons.zoom_out),
            onPressed: () {
              mapController.move(
                mapController.camera.center,
                mapController.camera.zoom - 1,
              );
            },
          ),
          const SizedBox(height: 10),
          // FloatingActionButton(
          //   heroTag: "my_location",
          //   child: const Icon(Icons.my_location),
          //   onPressed: () {
          //     if (OrdermapCubit.get(context).currentLocation != null) {
          //       mapController.move(
          //         LatLng(OrdermapCubit.get(context).currentLocation!.latitude!,
          //             OrdermapCubit.get(context).currentLocation!.longitude!),
          //         15.0,
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
