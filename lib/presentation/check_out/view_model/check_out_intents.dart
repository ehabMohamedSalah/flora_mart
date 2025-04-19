sealed class CheckoutIntent {}

class SelectAddressIntent extends CheckoutIntent {
  final String id;

  SelectAddressIntent({required this.id});
}

class InitAddressIntent extends CheckoutIntent {}
