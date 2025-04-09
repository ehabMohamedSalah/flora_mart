import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/categories_datasource.dart';
import 'package:flora_mart/data/model/categories/all_categories/categories.dart';
import 'package:flora_mart/domain/entity/categories_entity/all_categories_entity/categories_entity.dart';
import 'package:flora_mart/domain/repo_contract/categories_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl extends CategoriesRepo {
  final CategoriesDatasource categoriesDatasource;

  @factoryMethod
  CategoriesRepoImpl(this.categoriesDatasource);

  Future<ApiResult<List<CategoriesEntity>>> getAllCategories({
    required String id,
    required String name,
    required num productsCount,
  }) async {
    print(
        "📌 [Repository] Fetching categories with: id=$id, name=$name, productsCount=$productsCount");
    try {
      var result = await categoriesDatasource.getAllCategories(
        id: id,
        name: name,
        productsCount: productsCount,
      );

      if (result is SuccessApiResult<List<Categories>>) {
        var categories = result.data;

        print("📌 [Repository] Categories Fetched: $categories");

        if (categories == null || categories.isEmpty) {
          print("⚠️ [Repository] No categories available after fetching!");
          return ErrorApiResult(Exception(
              "No matching categories found for id=$id, name=$name, productsCount=$productsCount"));
        }

        var categoriesEntities = categories.map((category) {
          print("Mapping category: $category");
          return CategoriesEntity(
            id: category.id ?? '',
            name: category.name ?? '',
            productsCount: category.productsCount ?? 0,
          );
        }).toList();

        print("📌 [Repository] Mapped CategoriesEntities: $categoriesEntities");

        return SuccessApiResult(categoriesEntities);
      }
      if (result is ErrorApiResult<List<Categories>>) {
        print("❌ [Repository] Error: ${result.exception}");
        return ErrorApiResult(result.exception);
      }
      print("❌ [Repository] Unknown error occurred!");
      return ErrorApiResult(Exception("Unknown error occurred"));
    } catch (e) {
      print("❌ [Repository] Exception occurred: ${e.toString()}");
      return ErrorApiResult(Exception("Exception: ${e.toString()}"));
    }
  }
}
