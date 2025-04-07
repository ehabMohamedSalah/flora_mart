sealed class CategoriesIntent {}

class AllCategoriesIntent extends CategoriesIntent {
final String id;
final String name;
final num productsCount;

AllCategoriesIntent(
    {required this.id, required this.name,required this.productsCount});
}
