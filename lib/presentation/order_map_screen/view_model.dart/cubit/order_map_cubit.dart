import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/getSavedAddressResponce.dart';
import 'package:flora_mart/domain/usecase/tracked_order_usecase/get_route_usecase.dart';
import 'package:flora_mart/presentation/track_order_screeen/widget/custom_marker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

part 'order_map_state.dart';

@injectable
class OrdermapCubit extends Cubit<OrdermapState> {
  final GetRouteUsecase _getRouteUsecase;
  @factoryMethod
  OrdermapCubit(this._getRouteUsecase) : super(OrdermapInitial());

  // LocationData? currentLocation; // get current location
  List<LatLng> routesPoints = []; // for draw line in map from start to end
  List<Marker> markers = []; // for add markers in map

  static OrdermapCubit get(BuildContext context) =>
      Provider.of<OrdermapCubit>(context, listen: false);
  initMap(
      {required AddressesModel startAddress,
      required LatLng destination}) async {
    _getRoute(destination: destination, startAddress: startAddress);

    // await _getCurrentLocation();
    // if (currentLocation != null) {
    // }
  }

  // Future<void> _getCurrentLocation() async {
  //   var location = Location();
  //   try {
  //     var userLocation = await location.getLocation();

  //     currentLocation = userLocation;
  //     markers.add(Marker(
  //       width: 80,
  //       height: 80,
  //       point: LatLng(userLocation.latitude!, userLocation.longitude!),
  //       child: const CustomMarkerWidget(label: "Appartment", icon: Icons.home),
  //     ));
  //     emit(OrderMapUpdated());
  //   } on Exception {
  //     currentLocation = null;
  //   }
  //   location.onLocationChanged.listen(
  //     (LocationData newLocation) {
  //       currentLocation = newLocation;
  //       emit(OrderMapUpdated());
  //     },
  //   );
  // }

  Future<void> _getRoute(
      {required LatLng destination,
      required AddressesModel startAddress}) async {
    // log('currentLocation: $currentLocation');
    // if (currentLocation == null) return;
    // log('currentLocation: $currentLocation');
    final start = LatLng(double.parse(startAddress.lat ?? "0"),
        double.parse(startAddress.long ?? "0"));
    markers.add(Marker(
        width: 80,
        height: 80,
        point: start,
        child:
            const CustomMarkerWidget(label: "Appartment", icon: Icons.home)));
    var result =
        await _getRouteUsecase.call(destination: destination, start: start);

    switch (result) {
      case SuccessApiResult():
        log(result.data.toString());
        routesPoints = result.data ?? [];
        markers.add(Marker(
            width: 80,
            height: 80,
            point: destination,
            child:
                const CustomMarkerWidget(label: "Flowery", icon: Icons.store)));
        emit(OrderMapUpdated());
        break;

      case ErrorApiResult():
        emit(OrderMapError(result.exception.toString()));
        break;
    }
  }
}
