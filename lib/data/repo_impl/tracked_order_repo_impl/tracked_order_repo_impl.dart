import 'package:flora_mart/data/datasource_contract/tracked_order_datasource/tracked_order_datasource.dart';
import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:flora_mart/domain/repo_contract/tracked_order_repo/tracked_order_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TrackedOrderRepo)
class TrackedOrderRepoImpl implements TrackedOrderRepo {
  TrackedOrderDatasource trackedOrderDatasource;
  @factoryMethod
  TrackedOrderRepoImpl(this.trackedOrderDatasource);
  @override
  Stream<Result<OrderTrackerModel>> getTrackedOrder(String orderId) {
    return trackedOrderDatasource.getTrackedOrder(orderId);
  }

  @override
  Future<Result<void>> createTrackedOrder(OrderTrackerModel orderTrackerModel) {
    return trackedOrderDatasource.createTrackedOrder(orderTrackerModel);
  }
}
