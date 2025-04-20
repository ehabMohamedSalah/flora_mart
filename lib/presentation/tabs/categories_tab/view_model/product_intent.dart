sealed class ProductIntent {}

class GetProductsIntent extends ProductIntent {
  final String typeId;
  final String type;
  GetProductsIntent(this.typeId,this.type);
}


class GetProductsBasedOnFilterIntent extends ProductIntent {
  final String filter;
  GetProductsBasedOnFilterIntent(this.filter);
}