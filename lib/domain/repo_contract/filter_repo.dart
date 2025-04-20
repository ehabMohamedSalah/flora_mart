import 'package:flora_mart/core/api/api_result.dart';

import '../../data/model/products/Products.dart';

abstract class FilterRepo {
  Future<ApiResult<List<Products>>> getAllProductsBasedOnFilter(String filter);
}
