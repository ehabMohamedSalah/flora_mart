part of 'track_order_cubit.dart';

@immutable
sealed class TrackOrderState {}

final class TrackOrderInitial extends TrackOrderState {}

final class GetTrackOrderSuccessState extends TrackOrderState {
  OrderTrackerModel orderTrackerModel;
  GetTrackOrderSuccessState({required this.orderTrackerModel});
}

final class GetTrackOrderErrorState extends TrackOrderState {
  final String message;
  GetTrackOrderErrorState({required this.message});
}

final class GetTrackOrderLoadingState extends TrackOrderState {}

final class createTrackedOrderSuccessState extends TrackOrderState {
  String message;
  createTrackedOrderSuccessState({required this.message});
}

final class createTrackedOrderErrorState extends TrackOrderState {
  String message;
  createTrackedOrderErrorState({required this.message});
}
