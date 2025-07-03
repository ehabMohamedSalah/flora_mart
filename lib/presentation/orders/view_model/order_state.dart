part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}
final class OrderLoadingState extends OrderState{}
final class OrderErrorState extends OrderState{
  String errMessage;
  OrderErrorState(this.errMessage);
}
final class OrderSuccessState extends OrderState{
  OrderResponse response;
  OrderSuccessState(this.response);
}
