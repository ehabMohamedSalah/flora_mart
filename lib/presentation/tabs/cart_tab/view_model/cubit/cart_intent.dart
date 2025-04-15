sealed class CartIntent {}

class GetCartItemsIntent extends CartIntent {}

class RemoveFromCartIntent extends CartIntent {
  final String productId;
  RemoveFromCartIntent({required this.productId});
}

class AddToCartIntent extends CartIntent {
  final String productId;
  final int quantity;
  AddToCartIntent({required this.productId, required this.quantity});
}

class UpdateProductQuantityIntent extends CartIntent {
  final String productId;
  final int quantity;
  UpdateProductQuantityIntent(
      {required this.productId, required this.quantity});
}
