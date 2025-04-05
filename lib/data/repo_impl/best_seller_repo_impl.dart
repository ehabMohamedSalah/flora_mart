import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/best_seller_datasource.dart';
import 'package:flora_mart/data/model/BestSellerModel.dart';
import 'package:flora_mart/domain/repo_contract/best_seller_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BestSellerRepo)
class BestSellerRepoImpl implements BestSellerRepo {
  final BestSellerDataSource dataSource;

  @factoryMethod
  BestSellerRepoImpl(this.dataSource);

  @override
  Future<ApiResult<List<BestSellerModel>>> getBestSellers() {
    return dataSource.getBestSellers();
  }
}