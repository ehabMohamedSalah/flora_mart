import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/get_all_products_datasource.dart';
import 'package:flora_mart/data/model/product_model.dart';
import 'package:flora_mart/domain/entity/product_entity.dart';
import 'package:injectable/injectable.dart';
import '../../core/api/api_excuter.dart';
import '../../core/api/api_manager.dart';
import '../../core/api/endpoints.dart';

@Injectable(as: GetAllProductsDatasource)
class GetAllProductsDatasourceImpl implements GetAllProductsDatasource {
  final ApiManager apiManager;

  GetAllProductsDatasourceImpl(this.apiManager);


  @override
  Future<ApiResult<List<ProductEntity>>> getAllProducts(String categoryId) async {
    return await executeApi<List<ProductEntity>>(() async {
      var response;
      if(categoryId == " ") {
         response = await apiManager.getRequest(
          Endpoint: EndPoint.getAllProductsEndpoint,
        );
      }
      else {
        response = await apiManager.getRequest(
          Endpoint: EndPoint.getAllProductsEndpoint,
          queryParameters: {"category": categoryId}
        );
      }

      final products = response.data['products'] as List;
      return products.map((e) => ProductModel.fromJson(e)).toList();
    });
  }
}