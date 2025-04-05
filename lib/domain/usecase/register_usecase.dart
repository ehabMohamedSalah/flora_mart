import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/auth/auth_response_entity.dart';
import 'package:flora_mart/domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUsecase {
  final AuthRepo authRepo;

  RegisterUsecase(this.authRepo);

  Future<ApiResult<AuthResponseEntity>> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
    required String gender,
  }) async {
    return await authRepo.postRegister(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
      gender: gender,
    );
  }
}
