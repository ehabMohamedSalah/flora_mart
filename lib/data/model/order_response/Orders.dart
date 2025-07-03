import 'package:flora_mart/data/model/order_response/OrderItems.dart';

class Orders {
  Orders({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
  });

  Orders.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'];
    if (json['orderItems'] != null) {
      orderItems = [];
      json['orderItems'].forEach((v) {
        orderItems?.add(OrderItems.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'] is int
        ? json['totalPrice'].toDouble()
        : json['totalPrice'];  // Ensure totalPrice is handled as num
    paymentType = json['paymentType'];
    isPaid = json['isPaid'];
    isDelivered = json['isDelivered'];
    state = json['state'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderNumber = json['orderNumber'];
    v = json['__v'];
  }

  String? id;
  String? user;
  List<OrderItems>? orderItems;
  num? totalPrice;  // Changed to num to handle both int and double
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  num? v;  // Changed to num

  Orders copyWith({
    String? id,
    String? user,
    List<OrderItems>? orderItems,
    num? totalPrice,  // Changed to num
    String? paymentType,
    bool? isPaid,
    bool? isDelivered,
    String? state,
    String? createdAt,
    String? updatedAt,
    String? orderNumber,
    num? v,  // Changed to num
  }) =>
      Orders(
        id: id ?? this.id,
        user: user ?? this.user,
        orderItems: orderItems ?? this.orderItems,
        totalPrice: totalPrice ?? this.totalPrice,
        paymentType: paymentType ?? this.paymentType,
        isPaid: isPaid ?? this.isPaid,
        isDelivered: isDelivered ?? this.isDelivered,
        state: state ?? this.state,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        orderNumber: orderNumber ?? this.orderNumber,
        v: v ?? this.v,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['user'] = user;
    if (orderItems != null) {
      map['orderItems'] = orderItems?.map((v) => v?.toJson()).toList();
    }
    map['totalPrice'] = totalPrice;
    map['paymentType'] = paymentType;
    map['isPaid'] = isPaid;
    map['isDelivered'] = isDelivered;
    map['state'] = state;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['orderNumber'] = orderNumber;
    map['__v'] = v;
    return map;
  }
}
