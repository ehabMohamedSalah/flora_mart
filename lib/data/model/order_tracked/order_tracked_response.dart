import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flora_mart/data/model/order_tracked/order_status.dart';

class OrderTrackerModel {
  String? driverId;
  DateTime? estimatedArrival;
  String? driverName;
  String? driverPhone;
  String? driverStatus;
  String? orderId;
  String? userId;
  List<OrderStatus>? orderStatus;

  OrderTrackerModel({
    this.driverId,
    this.estimatedArrival,
    this.driverName,
    this.driverPhone,
    this.driverStatus,
    this.orderId,
    this.userId,
    this.orderStatus,
  });

  OrderTrackerModel.fromJson(Map<String, dynamic> data) {
    orderId = data['orderId'];
    userId = data['userId'];
    final arrival = data['estimatedArrival'];
    if (arrival is Timestamp) {
      estimatedArrival = arrival.toDate();
    } else {
      estimatedArrival = null;
    }
    driverId = data['driverId'];
    driverName = data['driverName'];
    driverPhone = data['driverPhone'];
    driverStatus = data['driverStatus'];

    if (data['orderStatus'] != null) {
      orderStatus = [];
      for (var item in data['orderStatus']) {
        orderStatus!.add(OrderStatus.fromjson(item));
      }
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'userId': userId,
      'estimatedArrival': estimatedArrival,
      'driverId': driverId,
      'driverName': driverName,
      'driverPhone': driverPhone,
      'driverStatus': driverStatus,
      'orderStatus': orderStatus?.map((e) => e.tojson()).toList(),
    };
  }
}
