import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_excuter.dart';
import '../../../core/api/api_manager.dart';
import '../../datasource_contract/forget_password_datasource/reset_password_datasource.dart';

@Injectable(as: ResetpasswordDataSourceRepo)
class Resetpassworddatasourcerepoimpl implements ResetpasswordDataSourceRepo {
  final ApiManager apiManager;

  Resetpassworddatasourcerepoimpl({required this.apiManager});

  @override
  Future<ApiResult<bool>> resetPassword(
      {required String email, required String password}) async {
    return await executeApi<bool>(() async {
      ("email  : $email ");
      var apiResponse = await apiManager.put(
        endpoint: EndPoint.resetPasswordEndpoint,
        data: {"email": email, "newPassword": password},
      );
      if (apiResponse.data != null &&
          apiResponse.data["message"] == "success") {
        return true;
      } else {
        return false;
      }
    });
  }
}
