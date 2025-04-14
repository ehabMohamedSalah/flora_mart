import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
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
  Future<ApiResult<GetLoggedUserDataModel>> getLoggedUserData() async {
    try {
      String token = await cacheHelper.getData<String>(Constant.tokenKey);
      var response = await apiManager.getRequest(
        endpoint: EndPoint.mainProfile,
        headers: {"Authorization": "Bearer $token"},
      );

      GetLoggedUserDataModel getLoggedUserDataModel =
          GetLoggedUserDataModel.fromJson(response.data);

      if (getLoggedUserDataModel.user != null) {
        return SuccessApiResult(getLoggedUserDataModel);
      }
      return ErrorApiResult(Exception(
          getLoggedUserDataModel.message ?? "An unknown error occurred"));
    } catch (err) {
      return ErrorApiResult(
          Exception("Server connection error: ${err.toString()}"));
    }
  }
}
