import 'package:flora_mart/core/api/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repo_contract/forget_password_repo_contract/verify_reset_code_repo.dart';
import '../../datasource_contract/forget_password_datasource/verify_reset_code_datasource.dart';

@Injectable(as: VerifyresetcodeRepo)
class Verifyresetcoderepoimpl implements VerifyresetcodeRepo {
  VerifyresetcodeRepoDataSource verifyresetcodeRepoDataSource;
  Verifyresetcoderepoimpl(this.verifyresetcodeRepoDataSource);

  @override
  Future<ApiResult<bool>> verifyResetCode({required String code}) {
    return verifyresetcodeRepoDataSource.verifyResetCode(code: code);
  }
}