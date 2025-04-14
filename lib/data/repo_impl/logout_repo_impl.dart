
import 'package:flora_mart/core/api/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo_contract/logout_repo_contract.dart';
import '../datasource_contract/logout_datasource.dart';


@Injectable(as: LogoutRepoContract)
class LogoutRepoImpl implements LogoutRepoContract {
  LogoutDatasource logoutDatasource;

  LogoutRepoImpl({required this.logoutDatasource});

  @override
  Future<ApiResult<bool>> logout() {
    return logoutDatasource.logout();
  }
}