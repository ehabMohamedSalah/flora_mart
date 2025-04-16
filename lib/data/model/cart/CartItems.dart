import 'package:flora_mart/data/model/cart/product.dart';

/// product : {"rateAvg":5,"rateCount":0,"_id":"673e2bd91159920171828139","title":"Red Wdding Flower","slug":"red-wdding-flower","description":"This is a Pack of Red Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png","images":["https://flower.elevateegy.com/uploads/ba028e59-410f-43ac-aed5-f4f97c102b98-image_four.png","https://flower.elevateegy.com/uploads/f89bc954-eb0d-4efb-928f-6717f77b69ed-image_one.png","https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png","https://flower.elevateegy.com/uploads/c0992ec6-d3c0-4a54-b7ec-4cf000138367-image_two.png"],"price":250,"priceAfterDiscount":150,"quantity":657,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T18:35:05.594Z","updatedAt":"2025-04-12T04:52:08.256Z","__v":0,"sold":343,"discount":50,"id":"673e2bd91159920171828139"}
/// price : 250
/// quantity : 5
/// _id : "67f9839ea9832d8359de53e9"

class CartItems {
  CartItems({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

  CartItems.fromJson(dynamic json) {
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
    quantity = json['quantity'];
    id = json['_id'];
  }
  Product? product;
  num? price;
  num? quantity;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    map['quantity'] = quantity;
    map['_id'] = id;
    return map;
  }
}
