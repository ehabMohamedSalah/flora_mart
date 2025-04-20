import 'package:flora_mart/core/api/api_result.dart';

import '../model/products/Products.dart';

abstract class FilterDatasource {
  Future<ApiResult<List<Products>>> getAllProductsBasedOnFilter(String filter);
}
