import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/Home/homeResponse.dart';
import 'package:flora_mart/data/model/UserModel.dart';

abstract class HomeRepo {
  Future<ApiResult<HomeResponse>> call();
}
