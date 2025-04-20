import 'package:flora_mart/core/api/api_result.dart';

import '../model/products/Products.dart';

abstract class SearchDatasource {
  Future<ApiResult<List<Products>>> getAllProductsBasedOnSearchQuery(String searchQuery);
}
