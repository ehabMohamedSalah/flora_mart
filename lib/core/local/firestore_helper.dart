import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';
import 'package:injectable/injectable.dart';

@injectable
@singleton
class FirestoreHelper {
  Future<void> createTrackedOrder(OrderTrackerModel orderTrackerModel) async {
    final orderData = orderTrackerModel.toJson();
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(orderTrackerModel.orderId)
        .set(orderData);
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getOrderStream(
      String orderId) {
    return _firestore.collection('orders').doc(orderId).snapshots();
  }

  // static Stream<OrderTrackerModel> getOrderTrackStatus() {
  //   getOrderStream('1234');
  // }
}
