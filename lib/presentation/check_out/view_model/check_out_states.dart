part of 'check_out_cubit.dart';

@immutable
sealed class CheckoutStates {}

final class CheckoutInitial extends CheckoutStates {}

final class CheckoutAddressSelected extends CheckoutStates {}

final class CheckoutPaymentWaySelected extends CheckoutStates {}

final class CheckoutNoAddressesFound extends CheckoutStates {}

class UpdateGiftSwitchState extends CheckoutStates {}

class CashOnDeliverySuccessState extends CheckoutStates {}

class CashOnDeliveryLoadingState extends CheckoutStates {}

class CashOnDeliveryErrorState extends CheckoutStates {
  final String? message;

  CashOnDeliveryErrorState({required this.message});
}

class CreditCardSuccessState extends CheckoutStates {
  final String? url;

  CreditCardSuccessState({required this.url});
}

class CreditCardLoadingState extends CheckoutStates {}

class CreditCardErrorState extends CheckoutStates {
  final String? message;

  CreditCardErrorState({required this.message});
}
