import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/UserModel.dart';
import 'package:injectable/injectable.dart';

import '../repo_contract/Login_Repo.dart';

@injectable
class LoginUsecase {
  final LoginRepo loginRepo;

  @factoryMethod
  LoginUsecase({
    required this.loginRepo,
  });

  Future<ApiResult<UserModel>> invoke({
    required String email,
    required bool  rememberMe,
    required String password,
  }) async {
    final result = await loginRepo.login(rememberMe :rememberMe,email: email, password: password);
    return result;
  }
}
