import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/order_response/OrderResponse.dart';

abstract class OrderDatasourceContract{
  Future<ApiResult<OrderResponse>> getOrder();
}