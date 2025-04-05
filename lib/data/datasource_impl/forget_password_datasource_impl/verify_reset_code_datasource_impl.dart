import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_excuter.dart';
import '../../../core/api/api_manager.dart';
import '../../datasource_contract/forget_password_datasource/verify_reset_code_datasource.dart';

@Injectable(as: VerifyresetcodeRepoDataSource)
class Verifyresetcoderepodatasourceimpl
    implements VerifyresetcodeRepoDataSource {
  final ApiManager apiManager;

  Verifyresetcoderepodatasourceimpl({required this.apiManager});

  Future<ApiResult<bool>> verifyResetCode({required String code}) async {
    return await executeApi<bool>(() async {
      var apiResponse = await apiManager.postRequest(
        endpoint: EndPoint.verifyEndpoint,
        body: {
          "resetCode": code,
        },
      );
      if (apiResponse.data != null && apiResponse.data["status"] == "Success") {
        print("same code✅");
        return true;
      } else {
        return false;
      }
    });
  }
}