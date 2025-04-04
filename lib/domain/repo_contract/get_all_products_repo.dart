import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/product_entity.dart';

abstract class GetAllProductsRepo {
  Future<ApiResult<List<ProductEntity>>> getAllProducts(String categoryId);
}