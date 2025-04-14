import 'package:flora_mart/domain/repo_contract/logout_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';

@injectable
class LogoutUsecase {
  LogoutRepoContract logoutRepoContract;
  @factoryMethod
  LogoutUsecase({required this.logoutRepoContract});

  Future<ApiResult<bool>> invoke() {
    return logoutRepoContract.logout();
  }
}
