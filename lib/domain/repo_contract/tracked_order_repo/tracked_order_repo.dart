import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';
import 'package:flora_mart/domain/common/result.dart';

abstract class TrackedOrderRepo {
  Stream<Result<OrderTrackerModel>> getTrackedOrder(String orderId);
  Future<Result<void>> createTrackedOrder(OrderTrackerModel orderTrackerModel);
}
