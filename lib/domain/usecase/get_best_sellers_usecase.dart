import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/BestSellerModel.dart';
import 'package:flora_mart/domain/repo_contract/best_seller_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBestSellersUseCase {
  final BestSellerRepo bestSellerRepo;

  @factoryMethod
  GetBestSellersUseCase(this.bestSellerRepo);

  Future<ApiResult<List<BestSellerModel>>> invoke() async {
    return await bestSellerRepo.getBestSellers();
  }
}