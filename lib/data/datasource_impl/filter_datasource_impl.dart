

import 'package:dio/src/response.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/filter_datasource.dart';
import 'package:injectable/injectable.dart';
import '../../core/api/api_excuter.dart';
import '../../core/api/api_manager.dart';
import '../../core/api/endpoints.dart';
import '../model/products/Products.dart';

@Injectable(as: FilterDatasource)
class FilterDatasourceImpl implements FilterDatasource {
  final ApiManager apiManager;

  FilterDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<List<Products>>> getAllProductsBasedOnFilter(
      String filter) async {
    return await executeApi<List<Products>>(() async {
      Response response;
      if (filter == "Lowest Price" ) {
        response = await apiManager.getRequest(
            endpoint: EndPoint.getAllProductsEndpoint,
            queryParameters: {"sort": "priceAfterDiscount"});
      }
      else if (filter == "Highest Price" ) {
        response = await apiManager.getRequest(
            endpoint: EndPoint.getAllProductsEndpoint,
            queryParameters: {"sort": "-priceAfterDiscount"});
      }
      else if (filter == "New" ) {
        response = await apiManager.getRequest(
            endpoint: EndPoint.getAllProductsEndpoint,
            queryParameters: {"sort": "-createdAt"});
      }
      else if (filter == "Old" ) {
        response = await apiManager.getRequest(
            endpoint: EndPoint.getAllProductsEndpoint,
            queryParameters: {"sort": "createdAt"});
      }
      else {
        response = await apiManager.getRequest(
            endpoint: EndPoint.getAllProductsEndpoint,
            queryParameters: {"sort": "discount"});
      }

      final products = response.data['products'] as List;
      return products.map((e) => Products.fromJson(e)).toList();
    });
  }
}

