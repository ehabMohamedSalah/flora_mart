// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/reset_password_data_sourse_repo.dart';
import 'package:flora_mart/data/model/UserModel.dart';
import 'package:flora_mart/domain/repo_contract/reset_password_repo.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_intent.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo_contract/Login_Repo.dart';
import '../datasource_contract/Login_Data_Source_Repo.dart';

@Injectable(as: ResetPasswordRepo)
class ResetPasswordRepoImpl implements ResetPasswordRepo {
  ResetPasswordDataSourceRepo resetPasswordDataSourceContract;

  @factoryMethod
  ResetPasswordRepoImpl(this.resetPasswordDataSourceContract);

  @override
  Future<ApiResult<bool>> resetPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return resetPasswordDataSourceContract.resetPassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
