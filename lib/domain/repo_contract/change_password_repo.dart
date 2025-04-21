import 'package:flora_mart/core/api/api_result.dart';

abstract class ChangePasswordRepo {
  Future<ApiResult<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}