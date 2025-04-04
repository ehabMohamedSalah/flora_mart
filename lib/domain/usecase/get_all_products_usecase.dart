import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/product_entity.dart';
import 'package:flora_mart/domain/repo_contract/get_all_products_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetAllProductsUsecase {
  final GetAllProductsRepo getAllProductsRepo;

  GetAllProductsUsecase(this.getAllProductsRepo);

  Future<ApiResult<List<ProductEntity>>> execute(String categoryId) =>
      getAllProductsRepo.getAllProducts(categoryId);
}