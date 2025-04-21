import 'package:injectable/injectable.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/change_password_datasource.dart';
import 'package:flora_mart/domain/repo_contract/change_password_repo.dart';

@Injectable(as: ChangePasswordRepo)
class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final ChangePasswordDatasource datasource;

  ChangePasswordRepoImpl(this.datasource);

  @override
  Future<ApiResult<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await datasource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}