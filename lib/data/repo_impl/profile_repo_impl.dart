import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/profile_datasource.dart';
import 'package:flora_mart/data/model/get_logged_user_data_model.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';
import 'package:flora_mart/domain/repo_contract/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileDatasource profileDatasource;

  @factoryMethod
  ProfileRepoImpl(this.profileDatasource);

  @override
  Future<ApiResult<GetLoggedUserDataEntity>> getLoggedUserData() async {
    ApiResult<GetLoggedUserDataModel> result =
        await profileDatasource.getLoggedUserData();

    if (result is SuccessApiResult<GetLoggedUserDataModel>) {
      return SuccessApiResult(result.data!.toGetLoggedUserDataEntity());
    } else if (result is ErrorApiResult<GetLoggedUserDataModel>) {
      return ErrorApiResult(result.exception);
    }
    return ErrorApiResult(Exception("Unknown error occurred"));
  }
}
