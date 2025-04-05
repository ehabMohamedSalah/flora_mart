import 'package:flora_mart/core/api/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../repo_contract/forget_password_repo_contract/verify_reset_code_repo.dart';


@injectable
class VerifyresetcodeUseCase {
  VerifyresetcodeRepo repo;
  @factoryMethod
  VerifyresetcodeUseCase({required this.repo});


  Future<ApiResult<bool>> check({required String code}) {
    return repo.verifyResetCode(code: code);
  }
}