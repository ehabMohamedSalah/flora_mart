import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/Home/homeResponse.dart';

abstract class HomeDataSourceRepo {
  Future<ApiResult<HomeResponse>> call();
}
