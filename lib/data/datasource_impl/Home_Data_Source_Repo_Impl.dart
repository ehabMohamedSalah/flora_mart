import 'dart:developer';
import 'package:flora_mart/core/api/api_excuter.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/data/datasource_contract/Home_Data_Source_Repo.dart';
import 'package:flora_mart/data/model/Home/homeResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSourceRepo)
class HomeDatasourceImpl implements HomeDataSourceRepo {
  final ApiManager apiManager;

  @factoryMethod
  HomeDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<HomeResponse>> call() async {
    return await executeApi<HomeResponse>(
      () async {
        var apiResponse = await apiManager.getRequest(
          Endpoint: EndPoint.homeEndpoint,
        );

        log('API Response: ${apiResponse.statusCode}');

        var response = HomeResponse.fromJson(apiResponse.data ?? {});

        return response;
      },
    );
  }
}
