import 'package:flora_mart/data/model/cart/Product.dart';

/// product : {"_id":"673e1cd711599201718280fb","title":"Wdding Flower","slug":"wdding-flower","description":"This is a Pack of White Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png","images":["https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png","https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png","https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"],"price":440,"priceAfterDiscount":100,"quantity":3828,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T17:31:03.303Z","updatedAt":"2025-04-19T01:39:35.446Z","__v":0,"discount":50,"sold":834,"rateAvg":3.5,"rateCount":30,"id":"673e1cd711599201718280fb"}
/// price : 440
/// quantity : 1
/// _id : "6803993fa9832d8359e4fd12"

class OrderItems {
  OrderItems({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

  OrderItems.fromJson(dynamic json) {
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
