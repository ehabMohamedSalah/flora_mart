// ignore_for_file: implementation_imports

import 'package:dio/src/response.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/get_all_products_datasource.dart';
import 'package:injectable/injectable.dart';
import '../../core/api/api_excuter.dart';
import '../../core/api/api_manager.dart';
import '../../core/api/endpoints.dart';
import '../model/products/Products.dart';

@Injectable(as: GetAllProductsDatasource)
class GetAllProductsDatasourceImpl implements GetAllProductsDatasource {
  final ApiManager apiManager;

  GetAllProductsDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<List<Products>>> getAllProducts(
      String typeId, String type) async {
    return await executeApi<List<Products>>(() async {
      Response response;
      if (typeId == " " || typeId == "") {
        response = await apiManager.getRequest(
          endpoint: EndPoint.getAllProductsEndpoint,
        );
      } else {
        response = await apiManager.getRequest(
            endpoint: EndPoint.getAllProductsEndpoint,
            queryParameters: {type: typeId});
      }

      final products = response.data['products'] as List;
      return products.map((e) => Products.fromJson(e)).toList();
    });
  }
}

/*
      String type = "occasion";
      String type = "category";
      String typeId = "673b34c21159920171827ae0";*/
