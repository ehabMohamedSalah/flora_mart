part of 'check_out_cubit.dart';

@immutable
sealed class CheckoutStates {}

final class CheckoutInitial extends CheckoutStates {}

final class CheckoutAddressSelected extends CheckoutStates {}

final class CheckoutPaymentWaySelected extends CheckoutStates {}

final class CheckoutNoAddressesFound extends CheckoutStates {}

class UpdateGiftSwitchState extends CheckoutStates {}

class PlaceOrderSuccessState extends CheckoutStates {}

class PlaceOrderLoadingState extends CheckoutStates {}

class PlaceOrderErrorState extends CheckoutStates {
  String? message;

  PlaceOrderErrorState({required this.message});
}
