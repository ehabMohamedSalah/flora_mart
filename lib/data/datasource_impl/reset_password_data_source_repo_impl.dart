// ignore_for_file: avoid_print, file_names, unnecessary_brace_in_string_interps

import 'package:flora_mart/core/api/api_excuter.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_contract/reset_password_data_sourse_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordDataSourceRepo)
class ResetPasswordDataSourceRepoImpl implements ResetPasswordDataSourceRepo {
  final ApiManager apiManager;
  final CacheHelper cacheHelper;

  @factoryMethod
  ResetPasswordDataSourceRepoImpl(this.cacheHelper, this.apiManager);

  @override
  Future<ApiResult<bool>> resetPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return await executeApi<bool>(() async {
      final String token = await cacheHelper.getData<String>(Constant.tokenKey);

      final apiResponse = await apiManager.patchRequest(
        endpoint: EndPoint.changePasswordEndpoint,
        body: {
          "password": oldPassword,
          "newPassword": newPassword,
        },
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      final String? newToken = apiResponse.data["token"];

      if (newToken != null) {
        final bool isTokenSaved = await cacheHelper.setData<String>(
          Constant.tokenKey,
          newToken,
        );

        if (isTokenSaved) {
          print("✅ New token saved successfully");
        } else {
          print("⛔ Failed to save new token");
        }
      }

      return apiResponse.data["message"] == "success";
    });
  }
}
