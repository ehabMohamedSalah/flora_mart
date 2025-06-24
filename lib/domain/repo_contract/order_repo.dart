import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';

import '../../data/model/order_response/OrderResponse.dart';

abstract class OrderRepo{
  Future<ApiResult<OrderResponse>> getOrder();
}