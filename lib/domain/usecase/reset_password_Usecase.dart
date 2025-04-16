
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/repo_contract/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUsecase {
  final ResetPasswordRepo resetPasswordRepo;

  @factoryMethod
  ResetPasswordUsecase({
    required this.resetPasswordRepo,
  });

  Future<ApiResult<bool>> invoke({
    required String oldPassword,
    required String newPassword,
  }) async {
    final result = await resetPasswordRepo.resetPassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    return result;
  }
}
