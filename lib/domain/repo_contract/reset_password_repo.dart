// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';

abstract class ResetPasswordRepo {
  Future<ApiResult<bool>> resetPassword({
    required String oldPassword,
    required String newPassword,
  });
}
