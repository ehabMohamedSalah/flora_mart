import 'package:flora_mart/data/model/address.dart';

sealed class CheckoutIntent {}

class SelectAddressIntent extends CheckoutIntent {
  final String id;
  final Address address;

  SelectAddressIntent({required this.address, required this.id});
}

class SelectPaymentWayIntent extends CheckoutIntent {
  final String id;

  SelectPaymentWayIntent({required this.id});
}

class InitAddressIntent extends CheckoutIntent {}

class InitPaymentWayIntent extends CheckoutIntent {}

class SelectGiftIntent extends CheckoutIntent {
  bool isSelected;

  SelectGiftIntent({required this.isSelected});
}
