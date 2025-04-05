import 'package:flora_mart/core/api/api_result.dart';


abstract class VerifyresetcodeRepoDataSource {
  Future<ApiResult<bool>> verifyResetCode({
    required String code,
  });
}