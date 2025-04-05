import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/UserModel.dart';

abstract class LoginDataSourceRepo {
  Future<ApiResult<UserModel>> login({
    required String email,
    required bool rememberMe,
    required String password,
  });
}
