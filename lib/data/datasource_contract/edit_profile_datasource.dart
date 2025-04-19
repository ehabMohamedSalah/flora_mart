// lib/data/datasource_contract/edit_profile_datasource.dart
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/get_logged_user_data_model.dart';

abstract class EditProfileDatasource {
  Future<ApiResult<GetLoggedUserDataModel>> editProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String gender,
  });

  Future<ApiResult<String>> uploadPhoto({
    required String photoPath,
  });
}
