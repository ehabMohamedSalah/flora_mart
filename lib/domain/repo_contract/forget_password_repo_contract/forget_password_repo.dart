

import '../../../core/api/api_result.dart';

abstract class ForgetpasswordRepo {
  Future<ApiResult<bool>> SendEmailVerification({
    required String email,
  });
}