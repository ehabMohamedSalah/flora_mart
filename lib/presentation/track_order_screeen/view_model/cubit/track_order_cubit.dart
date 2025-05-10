import 'dart:developer';

import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:flora_mart/domain/usecase/tracked_order_usecase/create_tracked_order_usecase.dart';
import 'package:flora_mart/domain/usecase/tracked_order_usecase/get_tracked_order_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'track_order_state.dart';

@injectable
class TrackOrderCubit extends Cubit<TrackOrderState> {
  @factoryMethod
  TrackOrderCubit(this.trackedOrderUsecase, this.createTrackedOrderUsecase)
      : super(TrackOrderInitial());
  final GetTrackedOrderUsecase trackedOrderUsecase;
  final CreateTrackedOrderUsecase createTrackedOrderUsecase;

  static TrackOrderCubit get(context) => BlocProvider.of(context);

  getTrackedOrder(String orderId) async {
    emit(GetTrackOrderLoadingState());
    log("model");
    var result = trackedOrderUsecase(orderId).listen((order) {
      if (order is Success<OrderTrackerModel>) {
        log(order.data?.driverName.toString() ?? "");
        emit(GetTrackOrderSuccessState(
            orderTrackerModel: order.data ?? OrderTrackerModel()));
      } else {
        log((order as Error).exception.toString());
        emit(GetTrackOrderErrorState(
            message: (order as Error).exception.toString()));
      }
    });
  }

  createTrackedOrder(OrderTrackerModel orderTrackerModel) async {
    var result = createTrackedOrderUsecase(orderTrackerModel);

    switch (result) {
      case Success():
        emit(createTrackedOrderSuccessState(message: "Order Tracked"));
        break;
      case Error():
        emit(createTrackedOrderErrorState(message: "error order tracked"));
        break;
      default:
    }
  }
}
