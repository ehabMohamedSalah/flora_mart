import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/get_all_products_datasource.dart';
import 'package:flora_mart/domain/repo_contract/get_all_products_repo.dart';
import 'package:injectable/injectable.dart';

import '../model/products/Products.dart';

@Injectable(as: GetAllProductsRepo)
class GetAllProductsRepoImpl implements GetAllProductsRepo {
  final GetAllProductsDatasource getAllProductsDatasource;

  GetAllProductsRepoImpl(this.getAllProductsDatasource);

  @override
  Future<ApiResult<List<Products>>> getAllProducts(String typeId, String type) {
    return getAllProductsDatasource.getAllProducts(typeId, type);
  }
}
