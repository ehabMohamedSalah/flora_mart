part of 'check_out_cubit.dart';

@immutable
sealed class CheckoutStates {}

final class CheckoutInitial extends CheckoutStates {}

final class CheckoutAddressSelected extends CheckoutStates {
  final String selectedId;

  CheckoutAddressSelected({required this.selectedId});
}

final class CheckoutNoAddressesFound extends CheckoutStates {}
