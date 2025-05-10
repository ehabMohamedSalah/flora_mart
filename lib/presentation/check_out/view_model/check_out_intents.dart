import 'package:flora_mart/data/model/getSavedAddressResponce.dart';
import 'package:flutter/material.dart';

sealed class CheckoutIntent {}

class SelectAddressIntent extends CheckoutIntent {
  final String id;
  final Addresses address;

  SelectAddressIntent({required this.address, required this.id});
}

class SelectPaymentWayIntent extends CheckoutIntent {
  final String id;

  SelectPaymentWayIntent({required this.id});
}

class SelectGiftIntent extends CheckoutIntent {
  bool isSelected;

  SelectGiftIntent({required this.isSelected});
}

class PlaceOrderIntent extends CheckoutIntent {
  final BuildContext context;
  final GlobalKey<FormState> formKey;

  PlaceOrderIntent({required this.context, required this.formKey});
}

class LaunchPaymentUrl extends CheckoutIntent {
  final BuildContext context;
  final String? url;
  final String orderId;

  LaunchPaymentUrl(
      {required this.context, required this.url, required this.orderId});
}

class GetSavedAddressIntent extends CheckoutIntent {}
