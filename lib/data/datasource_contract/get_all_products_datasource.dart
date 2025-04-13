import 'package:flora_mart/core/api/api_result.dart';

import '../model/products/Products.dart';

abstract class GetAllProductsDatasource {
  Future<ApiResult<List<Products>>> getAllProducts(String typeId, String type);
}
