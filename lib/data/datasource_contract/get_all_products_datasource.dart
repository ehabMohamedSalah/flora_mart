import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/product_entity.dart';

import '../model/products/Products.dart';

abstract class GetAllProductsDatasource {
  Future<ApiResult<List<Products>>> getAllProducts(String categoryId);
}