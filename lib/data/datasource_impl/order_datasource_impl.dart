
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/data/datasource_contract/order_datasource_contract.dart';
import 'package:flora_mart/data/model/order_response/OrderResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/cache/shared_pref.dart';
import '../../core/constant.dart';

@Injectable(as:OrderDatasourceContract )
class OrderDataSourceImpl extends OrderDatasourceContract{
  ApiManager apiManager;
  final CacheHelper cacheHelper;
  OrderDataSourceImpl(this.apiManager,this.cacheHelper);
  @override
  Future<ApiResult<OrderResponse>> getOrder() async{
    try{
      String token = await cacheHelper.getData<String>(Constant.tokenKey);

      var response= await apiManager.getRequest(
        endpoint: EndPoint.orderEndpoint,
        headers: {
          //"Authorization": "Bearer $token"
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjc4YTc4M2QzYzM3OTc0OTI3NDdjOGU2Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzcxMjc5OTd9.ey-sIWm8Z9QpiUNEfK5U-Ma5lzB2NxI7-DbKZfH1wfM"
        },
      );
      OrderResponse orderResponse=OrderResponse.fromJson(response.data);
      if(orderResponse.error!=null){
        return ErrorApiResult(Exception(
            orderResponse.error ));
      }else{
        return SuccessApiResult(orderResponse);;
      }
    }catch(error){
      return ErrorApiResult(Exception(error ));
    }

  }

}