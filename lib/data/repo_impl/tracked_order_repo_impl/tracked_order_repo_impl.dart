import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/tracked_order_datasource/tracked_order_datasource.dart';
import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:flora_mart/domain/repo_contract/tracked_order_repo/tracked_order_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

@Injectable(as: TrackedOrderRepo)
class TrackedOrderRepoImpl implements TrackedOrderRepo {
  TrackedOrderDatasource _trackedOrderDatasource;
  @factoryMethod
  TrackedOrderRepoImpl(this._trackedOrderDatasource);
  @override
  Stream<Result<OrderTrackerModel>> getTrackedOrder(String orderId) {
    return _trackedOrderDatasource.getTrackedOrder(orderId);
  }

  @override
  Future<Result<void>> createTrackedOrder(
      OrderTrackerModel orderTrackerModel) async {
    return await _trackedOrderDatasource.createTrackedOrder(orderTrackerModel);
  }

  @override
  Future<ApiResult<List<LatLng>>> getRoute(
      {required LatLng destination, required LatLng start}) async {
    return await _trackedOrderDatasource.getRoute(
        destination: destination, start: start);
  }
}
