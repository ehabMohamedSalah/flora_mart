
import 'package:flora_mart/core/api/api_result.dart';

abstract class ForgetpasswordDataSourseRepo {
  Future<ApiResult<bool>> SendEmailVerification({
    required String email,
  });
}