import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/get_logged_user_data_model.dart';

abstract class ProfileDatasource {
  Future<ApiResult<GetLoggedUserDataModel>> getLoggedUserData({
    required String firstName,
    required String email,
  });
}