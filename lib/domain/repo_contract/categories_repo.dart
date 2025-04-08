import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/categories_entity/all_categories_entity/categories_entity.dart';

abstract class CategoriesRepo {
  Future<ApiResult<List<CategoriesEntity>>> getAllCategories({
    required String id,
    required String name,
    required num productsCount,
  });
}
