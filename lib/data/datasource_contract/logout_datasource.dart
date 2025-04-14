import 'package:flora_mart/core/api/api_result.dart';

abstract class LogoutDatasource {
  Future<ApiResult<bool>> logout();
}