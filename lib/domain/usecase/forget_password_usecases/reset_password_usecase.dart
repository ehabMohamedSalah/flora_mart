import 'package:flora_mart/core/api/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../repo_contract/forget_password_repo_contract/reset_password_repo.dart';

@injectable
class ResetpasswordUsecase {
  ResetpasswordRepo repo;
  @factoryMethod
  ResetpasswordUsecase({required this.repo});

  Future<ApiResult<bool>> invoke(
      {required String email, required String password}) {
    return repo.resetPassword(email: email, password: password);
  }
}