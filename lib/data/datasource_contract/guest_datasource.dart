import 'package:flora_mart/domain/common/result.dart';

abstract class GuestDatasource {
//  Future<ApiResult<ResetPasswordResponseEntity>> ResetPassword({required String email,required String NewPassword});

  Future<Result<bool>> checkGuest();
  Future<bool> changeGuest({required bool isGuest});
}
