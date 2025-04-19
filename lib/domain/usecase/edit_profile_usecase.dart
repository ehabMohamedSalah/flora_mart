// lib/domain/usecase/edit_profile_usecase.dart
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';
import 'package:flora_mart/domain/repo_contract/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUsecase {
  final EditProfileRepo repo;

  EditProfileUsecase(this.repo);

  Future<ApiResult<GetLoggedUserDataEntity>> call({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String gender,
  }) async {
    return await repo.editProfile(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      gender: gender,
    );
  }
}
