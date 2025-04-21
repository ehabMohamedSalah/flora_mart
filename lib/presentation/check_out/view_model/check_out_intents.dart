import 'package:flora_mart/data/model/address.dart';
import 'package:flutter/material.dart';

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

class PlaceOrderIntent extends CheckoutIntent {
  final BuildContext context;
  final GlobalKey<FormState> formKey;

  PlaceOrderIntent({required this.context, required this.formKey});
}
