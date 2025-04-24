
import 'package:dio/dio.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/search_datasource.dart';
import 'package:injectable/injectable.dart';
import '../../core/api/api_excuter.dart';
import '../../core/api/api_manager.dart';
import '../../core/api/endpoints.dart';
import '../model/products/Products.dart';

@Injectable(as: SearchDatasource)
class SearchDatasourceImpl implements SearchDatasource {
  final ApiManager apiManager;

  SearchDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<List<Products>>> getAllProductsBasedOnSearchQuery(
      String searchQuery) async {
    return await executeApi<List<Products>>(() async {
      Response  response = await apiManager.getRequest(
            endpoint: EndPoint.getAllProductsEndpoint,
            queryParameters: {"keyword": searchQuery});


      final products = response.data['products'] as List;
      return products.map((e) => Products.fromJson(e)).toList();
    });
  }
}

