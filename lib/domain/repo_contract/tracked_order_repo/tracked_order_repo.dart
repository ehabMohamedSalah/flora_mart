import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:latlong2/latlong.dart';

abstract class TrackedOrderRepo {
  Stream<Result<OrderTrackerModel>> getTrackedOrder(String orderId);
  Future<Result<void>> createTrackedOrder(OrderTrackerModel orderTrackerModel);
  Future<ApiResult<List<LatLng>>> getRoute(
      {required LatLng destination, required LatLng start});
}
