import 'package:injectable/injectable.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/repo_contract/change_password_repo.dart';

@injectable
class ChangePasswordUsecase {
  final ChangePasswordRepo changePasswordRepo;

  ChangePasswordUsecase(this.changePasswordRepo);

  Future<ApiResult<void>> call({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await changePasswordRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}