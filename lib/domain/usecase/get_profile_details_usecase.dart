import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';
import 'package:flora_mart/domain/repo_contract/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileDetailsUsecase {
  final ProfileRepo profileRepo;

  GetProfileDetailsUsecase(this.profileRepo);

  Future<ApiResult<GetLoggedUserDataEntity>> call({
    required String firstName,
    required String email,
  }) async {
    print(
        'UpdateProfileUsecase called with firstName: $firstName, email: $email');

    ApiResult<GetLoggedUserDataEntity> result =
        await profileRepo.getLoggedUserData(
      firstName: firstName,
      email: email,
    );
    print('Result from ProfileRepo: $result');

    return result;
  }
}
