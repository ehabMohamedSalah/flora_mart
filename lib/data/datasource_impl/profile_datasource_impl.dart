import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/data/datasource_contract/profile_datasource.dart';
import 'package:flora_mart/data/model/get_logged_user_data_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileDatasource)
class ProfileDatasourceImpl implements ProfileDatasource {
  final ApiManager apiManager;
  final CacheHelper cacheHelper;

  @factoryMethod
  ProfileDatasourceImpl(this.apiManager, this.cacheHelper);

  @override
  Future<ApiResult<GetLoggedUserDataModel>> getLoggedUserData(
      {required String firstName, required String email}) async {
    try {
      var token = await cacheHelper.getData('token');

      print('Token: $token');
      var response = await apiManager.getRequest(
        endpoint: EndPoint.mainProfile,
        headers: {
          'token': token,
        },
      );
      print('Response: ${response.data}');

      GetLoggedUserDataModel getLoggedUserDataModel =
          GetLoggedUserDataModel.fromJson(response.data);

      if (getLoggedUserDataModel.user != null) {
        print('SuccessProfile:${SuccessApiResult(getLoggedUserDataModel)}');
        return SuccessApiResult(getLoggedUserDataModel);
      }
      print('Error: ${getLoggedUserDataModel.message ?? "An unknown error occurred"}');
      return ErrorApiResult(Exception(
          getLoggedUserDataModel.message ?? "An unknown error occurred"));
    } catch (err) {
      print('Error: ${err.toString()}');
      return ErrorApiResult(
          Exception("Server connection error: ${err.toString()}"));
    }
  }
}