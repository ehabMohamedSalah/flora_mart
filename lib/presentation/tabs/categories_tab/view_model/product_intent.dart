sealed class ProductIntent {}

class GetProductsIntent extends ProductIntent {
  final String categoryId;
  GetProductsIntent(this.categoryId);
}