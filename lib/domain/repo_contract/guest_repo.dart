import 'package:flora_mart/domain/common/result.dart';

abstract class GuestRepo {
  // Future<ApiResult<ForgetPasswordEntity>> ForgetPassword({required String email });
  Future<Result<bool>> checkGuest();
  Future<bool> changeGuest({required bool isGuest});
}
