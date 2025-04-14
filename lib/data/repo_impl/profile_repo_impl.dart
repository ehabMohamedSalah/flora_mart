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
  Future<ApiResult<GetLoggedUserDataEntity>> getLoggedUserData(
      {required String firstName, required String email}) async {
    print('Fetching data for: $firstName, $email');

    ApiResult<GetLoggedUserDataModel> result = await profileDatasource
        .getLoggedUserData(firstName: firstName, email: email);

    print('Datasource result: $result');

    if (result is SuccessApiResult<GetLoggedUserDataModel>) {
      print('Success result: ${result.data}');
      return SuccessApiResult(result.data!.toGetLoggedUserDataEntity());
    } else if (result is ErrorApiResult<GetLoggedUserDataModel>) {
      print('Error result: ${result.exception}');
      return ErrorApiResult(result.exception);
    }
    print('Unknown error occurred');
    return ErrorApiResult(Exception("Unknown error occurred"));
  }
}
