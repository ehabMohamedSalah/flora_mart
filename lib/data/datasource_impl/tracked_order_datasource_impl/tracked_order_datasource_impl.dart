import 'package:flora_mart/core/api/api_excuter.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/core/local/firestore_helper.dart';
import 'package:flora_mart/data/datasource_contract/tracked_order_datasource/tracked_order_datasource.dart';
import 'package:flora_mart/data/model/order_tracked/order_status.dart';
import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

@Injectable(as: TrackedOrderDatasource)
class TrackedOrderDatasourceImpl implements TrackedOrderDatasource {
  final FirestoreHelper _firestoreHelper;
  final ApiManager _apiManager;
  @factoryMethod
  TrackedOrderDatasourceImpl(this._firestoreHelper, this._apiManager);
  @override
  Stream<Result<OrderTrackerModel>> getTrackedOrder(String orderId) {
    var snapshot = _firestoreHelper.getOrderStream(orderId);
    return snapshot.map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        return Success(OrderTrackerModel.fromJson(snapshot.data()!));
      } else {
        return Error(Exception('order not found'));
      }
    });
  }

  @override
  Future<Result<void>> createTrackedOrder(
      OrderTrackerModel orderTrackerModel) async {
    var orderModel = OrderTrackerModel(
        orderId: orderTrackerModel.orderId,
        userId: orderTrackerModel.userId,
        estimatedArrival: orderTrackerModel.estimatedArrival,
        userLatitude: orderTrackerModel.userLatitude,
        userLongitude: orderTrackerModel.userLongitude,
        orderStatus: [
          OrderStatus(
            statusName: 'Received your order',
            isDone: false,
          ),
          OrderStatus(
            statusName: 'Preparing your order',
            isDone: false,
          ),
          OrderStatus(
            statusName: 'Out for delivery',
            isDone: false,
          ),
          OrderStatus(
            statusName: 'Delivered',
            isDone: false,
          )
        ]);
    try {
      await _firestoreHelper.createTrackedOrder(orderModel);
      return Success(null);
    } catch (error) {
      return Error(Exception(error.toString()));
    }
  }

  @override
  Future<ApiResult<List<LatLng>>> getRoute(
      {required LatLng destination, required LatLng start}) async {
    return executeApi(
      () async {
        var apiResponse = await _apiManager.getRequest(
            endpoint: EndPoint.getRouteEndPoint(
                start: start,
                destination: destination,
                orsApiKey: Constant.orsApiKey));
        final List<dynamic> coords =
            apiResponse.data['features'][0]['geometry']['coordinates'];
        List<LatLng> latLongList = coords
            .map((coord) => LatLng(coord[1], coord[0]))
            .toList(); // result
        return latLongList;
      },
    );
  }
}
