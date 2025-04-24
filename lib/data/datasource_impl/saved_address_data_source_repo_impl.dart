// ignore_for_file: avoid_print, file_names, unnecessary_brace_in_string_interps

import 'package:flora_mart/core/api/api_excuter.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_contract/saved_Address_data_source_repo.dart';
import 'package:flora_mart/data/model/getSavedAddressResponce.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SavedAddressDataSourceRepo)
class SavedAddressDataSourceRepoImpl implements SavedAddressDataSourceRepo {
  final ApiManager apiManager;
  final CacheHelper cacheHelper;

  @factoryMethod
  SavedAddressDataSourceRepoImpl(this.cacheHelper, this.apiManager);

  @override
  Future<ApiResult<bool>> delete({required String id}) async {
    return await executeApi<bool>(() async {
      final String token = await cacheHelper.getData<String>(Constant.tokenKey);
      final apiResponse = await apiManager.delete(
        endpoint: EndPoint.deleteSavedAddres(id),
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      return apiResponse.data["message"] == "success";
    });
  }

  @override
  Future<ApiResult<GetSavedAddressResponce>> getSavedAddress() async {
    return await executeApi<GetSavedAddressResponce>(() async {
      final String token = await cacheHelper.getData<String>(Constant.tokenKey);
      final apiResponse = await apiManager.getRequest(
        endpoint: EndPoint.getSavedAddress,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      GetSavedAddressResponce getSavedAddressResponce =
          GetSavedAddressResponce.fromJson(apiResponse.data);

      return getSavedAddressResponce;
    });
  }
}
