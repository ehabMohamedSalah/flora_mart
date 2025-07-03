part of 'order_map_cubit.dart';

@immutable
sealed class OrdermapState {}

final class OrdermapInitial extends OrdermapState {}

class OrderMapUpdated extends OrdermapState {}

class OrderMapError extends OrdermapState {
  final String message;
  OrderMapError(this.message);
}
