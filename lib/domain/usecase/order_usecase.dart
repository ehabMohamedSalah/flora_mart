
import 'package:flora_mart/domain/repo_contract/order_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data/model/order_response/OrderResponse.dart';

@injectable
class OrderUsecase{
  OrderRepo repo;
  OrderUsecase(this.repo);

  Future<ApiResult<OrderResponse>> call(){
    return repo.getOrder();
  }
}