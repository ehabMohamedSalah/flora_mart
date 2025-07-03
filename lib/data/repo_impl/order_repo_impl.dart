

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/order_datasource_contract.dart';
import 'package:flora_mart/data/model/order_response/OrderResponse.dart';
import 'package:flora_mart/domain/repo_contract/order_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:OrderRepo )
class OrderRepoIml extends OrderRepo{
  OrderDatasourceContract api;
  OrderRepoIml(this.api);
  @override
  Future<ApiResult<OrderResponse>> getOrder() {
    return api.getOrder();
  }

}