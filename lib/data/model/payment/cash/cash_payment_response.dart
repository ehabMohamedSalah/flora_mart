import '../cash/Order.dart';

/// message : "success"
/// order : {"user":"67e7f2cb836ee8be7063171b","orderItems":[{"product":{"_id":"673e1cd711599201718280fb","title":"Wdding Flower","slug":"wdding-flower","description":"This is a Pack of White Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png","images":["https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png","https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png","https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"],"price":440,"priceAfterDiscount":100,"quantity":3828,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T17:31:03.303Z","updatedAt":"2025-04-19T01:39:35.446Z","__v":0,"discount":50,"sold":834,"rateAvg":3.5,"rateCount":30,"id":"673e1cd711599201718280fb"},"price":440,"quantity":1,"_id":"6803993fa9832d8359e4fd12"},{"product":{"rateAvg":5,"rateCount":0,"_id":"673e2bd91159920171828139","title":"Red Wdding Flower","slug":"red-wdding-flower","description":"This is a Pack of Red Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png","images":["https://flower.elevateegy.com/uploads/ba028e59-410f-43ac-aed5-f4f97c102b98-image_four.png","https://flower.elevateegy.com/uploads/f89bc954-eb0d-4efb-928f-6717f77b69ed-image_one.png","https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png","https://flower.elevateegy.com/uploads/c0992ec6-d3c0-4a54-b7ec-4cf000138367-image_two.png"],"price":250,"priceAfterDiscount":150,"quantity":648,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T18:35:05.594Z","updatedAt":"2025-04-19T01:37:45.729Z","__v":0,"sold":352,"discount":50,"id":"673e2bd91159920171828139"},"price":250,"quantity":1,"_id":"68039947a9832d8359e4fd1e"}],"totalPrice":345,"paymentType":"cash","isPaid":false,"isDelivered":false,"state":"pending","_id":"68039974a9832d8359e4fd32","createdAt":"2025-04-19T12:39:16.279Z","updatedAt":"2025-04-19T12:39:16.279Z","orderNumber":"#124212","__v":0}

class CashPaymentResponse {
  CashPaymentResponse({
    this.message,
    this.order,
  });

  CashPaymentResponse.fromJson(dynamic json) {
    message = json['message'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
  String? message;
  Order? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (order != null) {
      map['order'] = order?.toJson();
    }
    return map;
  }
}
