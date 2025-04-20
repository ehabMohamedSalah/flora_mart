import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/search_datasource.dart';
import 'package:flora_mart/domain/repo_contract/search_repo.dart';
import 'package:injectable/injectable.dart';

import '../model/products/Products.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final SearchDatasource searchDatasource;

  SearchRepoImpl(this.searchDatasource);

  @override
  Future<ApiResult<List<Products>>> getAllProductsBasedOnSearchQuery(String searchQuery) {
    return searchDatasource.getAllProductsBasedOnSearchQuery(searchQuery);
  }
}
