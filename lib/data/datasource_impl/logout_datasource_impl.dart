import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import '../../../core/api/api_excuter.dart';
import '../../../core/api/api_manager.dart';
import '../../core/constant.dart';
import '../datasource_contract/logout_datasource.dart';

@Injectable(as: LogoutDatasource)
class LogoutDatasourceImpl implements LogoutDatasource {
  final ApiManager apiManager;
  final CacheHelper cacheHelper;

  LogoutDatasourceImpl({required this.apiManager,required this.cacheHelper});

  @override
  Future<ApiResult<bool>> logout() async {
    try {
      String token = await cacheHelper.getData<String>(Constant.tokenKey);

      return await executeApi<bool>(() async {
        var apiResponse = await apiManager.getRequest(
          endpoint: EndPoint.logoutEndpoint,
          headers: {"Authorization": "Bearer $token"},
        );
        if (apiResponse.data != null &&
            apiResponse.data["message"] == "success") {
          bool removeToken = await cacheHelper.logout();
          if (removeToken)
            return true;
          else
            return false;
        } else {
          return false;
        }
      });
    }
    catch (err) {
      return ErrorApiResult(
          Exception("Server connection error: ${err.toString()}"));
    }
  }
}