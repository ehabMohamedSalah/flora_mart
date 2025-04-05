import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/auth/auth_response_entity.dart';

abstract class AuthRepo {
  Future<ApiResult<AuthResponseEntity>> postRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
    required String gender,
  });
}
