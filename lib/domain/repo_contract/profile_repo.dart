import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';

abstract class ProfileRepo {
  Future<ApiResult<GetLoggedUserDataEntity>> getLoggedUserData({
    required String firstName,
    required String email,
  });
}
