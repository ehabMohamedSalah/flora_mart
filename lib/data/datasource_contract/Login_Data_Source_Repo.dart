// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/UserModel.dart';

abstract class LoginDataSourceRepo {
  Future<ApiResult<UserModel>> login({
    required String email,
    required bool rememberMe,
    required String password,
  });
}
