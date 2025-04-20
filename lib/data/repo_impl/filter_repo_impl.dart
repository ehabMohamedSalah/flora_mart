import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/filter_datasource.dart';
import 'package:flora_mart/domain/repo_contract/filter_repo.dart';
import 'package:injectable/injectable.dart';

import '../model/products/Products.dart';

@Injectable(as: FilterRepo)
class FilterRepoImpl implements FilterRepo {
  final FilterDatasource filterDatasource;

  FilterRepoImpl(this.filterDatasource);

  @override
  Future<ApiResult<List<Products>>> getAllProductsBasedOnFilter(String filter) {
    return filterDatasource.getAllProductsBasedOnFilter(filter);
  }
}
