import 'package:flora_mart/core/api/api_excuter.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_contract/Login_Data_Source_Repo.dart';
import 'package:flora_mart/data/model/UserModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginDataSourceRepo)
class LoginDatasourceImpl implements LoginDataSourceRepo {
  final ApiManager apiManager;
  final CacheHelper cacheHelper;

  @factoryMethod
  LoginDatasourceImpl(this.apiManager, this.cacheHelper);

  @override
  Future<ApiResult<UserModel>> login({
    required String email,
    required bool rememberMe,
    required String password,
  }) async {
    return await executeApi<UserModel>(
      () async {
        var apiResponse = await apiManager.postRequest(
          endpoint: EndPoint.signInEndpoint,
          body: {
            "email": email,
            "password": password,
          },
        );

        print('API Response: ${apiResponse.data}'); // Print full response
        print('API Response: ${apiResponse.statusCode}'); // Print full response
        // Print full response

        var response = UserModel.fromJson(apiResponse.data ?? {});
        // ============ Save Token ===============\\
        if (response.token != null) {
          bool setToken = await cacheHelper.setData<String>(
              Constant.tokenKey, response.token ?? "");
          if (setToken) {
            print('Token saved: ${response.token} ✅✅');
            // ========== Remember me Token  ========= \\

            bool setRememberMe = await cacheHelper.setData<bool>(
                Constant.isRememberMe, rememberMe==true ? rememberMe : false);

            setRememberMe
                ? print('isRememberMe saved: ${rememberMe} ✅✅')
                : print('isRememberMe not saved⛔⛔, setting to null');
            // ========== Remember me Token  ========= \\
          } else {
            print('Token not saved⛔⛔');
          }
        }
        // ============ Save Token ===============\\

        return response;
      },
    );
  }
}
