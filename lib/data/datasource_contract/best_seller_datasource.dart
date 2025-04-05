import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/BestSellerModel.dart';

abstract class BestSellerDataSource {
  Future<ApiResult<List<BestSellerModel>>> getBestSellers();
}