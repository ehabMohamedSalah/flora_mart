// lib/data/datasource_impl/edit_profile_datasource_impl.dart
// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_contract/edit_profile_datasource.dart';
import 'package:flora_mart/data/model/get_logged_user_data_model.dart';
import 'package:injectable/injectable.dart';
import 'package:http_parser/http_parser.dart';

@Injectable(as: EditProfileDatasource)
class EditProfileDatasourceImpl implements EditProfileDatasource {
  final ApiManager apiManager;
  final CacheHelper cacheHelper;

  EditProfileDatasourceImpl(this.apiManager, this.cacheHelper);

  @override
  Future<ApiResult<GetLoggedUserDataModel>> editProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String gender,
  }) async {
    try {
      String? token = await cacheHelper.getData<String>(Constant.tokenKey);

      if (token.isEmpty) {
        return ErrorApiResult(Exception("No authentication token found"));
      }

      final requestData = {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
      };

      final headers = {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

      var response = await apiManager.put(
        endpoint: EndPoint.editProfile,
        data: requestData,
        headers: headers,
      );

      GetLoggedUserDataModel userDataModel =
          GetLoggedUserDataModel.fromJson(response.data);

      return SuccessApiResult(userDataModel);
    } on DioException catch (dioError) {
      if (dioError.response?.data is Map) {
        return ErrorApiResult(
            Exception(dioError.response?.data['error'] ?? dioError.message));
      }
      return ErrorApiResult(
          Exception("Failed to edit profile: ${dioError.message}"));
    } catch (err) {
      return ErrorApiResult(
          Exception("Failed to edit profile: ${err.toString()}"));
    }
  }

  @override
  Future<ApiResult<String>> uploadPhoto({required String photoPath}) async {
    try {
      String? token = await cacheHelper.getData<String>(Constant.tokenKey);

      final isPng = photoPath.toLowerCase().endsWith('.png');
      final file = await MultipartFile.fromFile(
        photoPath,
        filename: isPng ? 'photo.png' : 'photo.jpg',
        contentType: MediaType('image', isPng ? 'png' : 'jpeg'),
      );

      final formData = FormData();
      formData.files.add(
        MapEntry('photo', file),
      );

      var response = await apiManager.putFormData(
        endpoint: EndPoint.uploadPhoto,
        formData: formData,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.data is Map && response.data['message'] == 'success') {
        return SuccessApiResult("Photo uploaded successfully");
      }

      return ErrorApiResult(Exception("Failed to upload photo"));
    } on DioException catch (dioError) {
      return ErrorApiResult(
          Exception("Failed to upload photo: ${dioError.message}"));
    }
  }
}
