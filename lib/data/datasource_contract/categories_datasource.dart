import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/categories/all_categories/categories.dart';

abstract class CategoriesDatasource {
  Future<ApiResult<List<Categories>>> getAllCategories({
    required String id,
    required String name,
    required num productsCount
  });
}
