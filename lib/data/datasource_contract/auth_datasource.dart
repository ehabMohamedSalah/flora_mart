import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/auth/auth_response.dart';

abstract class AuthDatasource {
  Future<ApiResult<AuthResponse>> postRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
    required String gender,
  });
}
