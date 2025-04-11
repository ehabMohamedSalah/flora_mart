import 'package:flora_mart/core/api/api_excuter.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/data/datasource_contract/best_seller_datasource.dart';
import 'package:flora_mart/data/model/BestSellerModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BestSellerDataSource)
class BestSellerDataSourceImpl implements BestSellerDataSource {
  final ApiManager apiManager;

  @factoryMethod
  BestSellerDataSourceImpl(this.apiManager);

  @override
  Future<ApiResult<List<BestSellerModel>>> getBestSellers() async {
    return await executeApi<List<BestSellerModel>>(() async {
      var response = await apiManager.getRequest(
        endpoint: EndPoint.bestSellerEndpoint,
      );

      List<dynamic> bestSellerList = response.data['bestSeller'] ?? [];
      return bestSellerList
          .map((item) => BestSellerModel.fromJson(item))
          .toList();
    });
  }
}
