import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/product_entity.dart';
import 'package:flora_mart/domain/repo_contract/get_all_products_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/products/Products.dart';


@injectable
class GetAllProductsUsecase {
  final GetAllProductsRepo getAllProductsRepo;

  GetAllProductsUsecase(this.getAllProductsRepo);

  Future<ApiResult<List<Products>>> execute(String typeId,String type) =>
      getAllProductsRepo.getAllProducts(typeId,type);
}