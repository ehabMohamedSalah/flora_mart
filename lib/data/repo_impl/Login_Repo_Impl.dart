import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/UserModel.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo_contract/Login_Repo.dart';
import '../datasource_contract/Login_Data_Source_Repo.dart';

@Injectable(as: LoginRepo)
class SigninRepoImpl implements LoginRepo {
  LoginDataSourceRepo loginDataSourceContract;

  @factoryMethod
  SigninRepoImpl(this.loginDataSourceContract);

  @override
  Future<ApiResult<UserModel>> login({
    required String email,
    required bool rememberMe,
    required String password,
  }) async {
    return loginDataSourceContract.login(rememberMe: rememberMe,email: email, password: password);
  }
}
