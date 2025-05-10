import 'package:flora_mart/core/local/firestore_helper.dart';
import 'package:flora_mart/data/datasource_contract/tracked_order_datasource/tracked_order_datasource.dart';
import 'package:flora_mart/data/model/order_tracked/order_status.dart';
import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TrackedOrderDatasource)
class TrackedOrderDatasourceImpl implements TrackedOrderDatasource {
  FirestoreHelper firestoreHelper;
  @factoryMethod
  TrackedOrderDatasourceImpl(this.firestoreHelper);
  @override
  Stream<Result<OrderTrackerModel>> getTrackedOrder(String orderId) {
    var snapshot = firestoreHelper.getOrderStream(orderId);
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
      await firestoreHelper.createTrackedOrder(orderModel);
      return Success(null);
    } catch (error) {
      return Error(Exception(error.toString()));
    }
  }
}
