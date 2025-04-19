// lib/domain/repository/edit_profile_repo.dart
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';

abstract class EditProfileRepo {
  Future<ApiResult<GetLoggedUserDataEntity>> editProfile({
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
