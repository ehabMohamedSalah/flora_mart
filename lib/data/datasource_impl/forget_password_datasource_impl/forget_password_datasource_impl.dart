import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_excuter.dart';
import '../../../core/api/api_manager.dart';
import '../../datasource_contract/forget_password_datasource/forget_password_datasource.dart';

@Injectable(as: ForgetpasswordDataSourseRepo)
class ForgetpasswordDataSourceRepoImpl implements ForgetpasswordDataSourseRepo {
  final ApiManager apiManager;

  ForgetpasswordDataSourceRepoImpl({required this.apiManager});

  @override
  Future<ApiResult<bool>> sendEmailVerification({required String email}) async {
    return await executeApi<bool>(() async {
      var apiResponse = await apiManager.postRequest(
        endpoint: EndPoint.forgetPasswordEndpoints,
        body: {
          "email": email,
        },
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
