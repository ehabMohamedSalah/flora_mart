import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';
import 'package:flora_mart/domain/repo_contract/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileDetailsUsecase {
  final ProfileRepo profileRepo;

  GetProfileDetailsUsecase(this.profileRepo);

  Future<ApiResult<GetLoggedUserDataEntity>> call() async {
    ApiResult<GetLoggedUserDataEntity> result =
        await profileRepo.getLoggedUserData();

    return result;
  }
}
