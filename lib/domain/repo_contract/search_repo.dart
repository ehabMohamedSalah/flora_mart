import 'package:flora_mart/core/api/api_result.dart';

import '../../data/model/products/Products.dart';

abstract class SearchRepo {
  Future<ApiResult<List<Products>>> getAllProductsBasedOnSearchQuery(String searchQuery);
}
