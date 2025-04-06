import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/product_entity.dart';

import '../../data/model/products/Products.dart';

abstract class GetAllProductsRepo {
  Future<ApiResult<List<Products>>> getAllProducts(String categoryId);
}