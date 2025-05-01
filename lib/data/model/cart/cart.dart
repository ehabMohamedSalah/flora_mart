// ignore_for_file: file_names

import 'package:flora_mart/data/model/cart/cart_Items.dart';

/// _id : "67f96722a9832d8359de16df"
/// user : "678a783d3c3797492747c8e6"
/// cartItems : [{"product":{"rateAvg":5,"rateCount":0,"_id":"673e2bd91159920171828139","title":"Red Wdding Flower","slug":"red-wdding-flower","description":"This is a Pack of Red Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png","images":["https://flower.elevateegy.com/uploads/ba028e59-410f-43ac-aed5-f4f97c102b98-image_four.png","https://flower.elevateegy.com/uploads/f89bc954-eb0d-4efb-928f-6717f77b69ed-image_one.png","https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png","https://flower.elevateegy.com/uploads/c0992ec6-d3c0-4a54-b7ec-4cf000138367-image_two.png"],"price":250,"priceAfterDiscount":150,"quantity":657,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T18:35:05.594Z","updatedAt":"2025-04-12T04:52:08.256Z","__v":0,"sold":343,"discount":50,"id":"673e2bd91159920171828139"},"price":250,"quantity":5,"_id":"67f9839ea9832d8359de53e9"},{"product":{"_id":"673e1cd711599201718280fb","title":"Wdding Flower","slug":"wdding-flower","description":"This is a Pack of White Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png","images":["https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png","https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png","https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"],"price":440,"priceAfterDiscount":100,"quantity":3913,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T17:31:03.303Z","updatedAt":"2025-04-12T13:09:10.950Z","__v":0,"discount":50,"sold":749,"rateAvg":3.5,"rateCount":30,"id":"673e1cd711599201718280fb"},"price":440,"quantity":24,"_id":"67fa6a6ba9832d8359de9450"}]
/// discount : 50
/// totalPrice : 11810
/// totalPriceAfterDiscount : 5905
/// createdAt : "2025-04-11T19:01:54.266Z"
/// updatedAt : "2025-04-13T13:52:13.779Z"
/// __v : 3

class Cart {
  Cart({
    this.id,
    this.user,
    this.cartItems,
    this.discount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Cart.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'];
    if (json['cartItems'] != null) {
      cartItems = [];
      json['cartItems'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
    discount = json['discount'];
    totalPrice = json['totalPrice'];
    totalPriceAfterDiscount = json['totalPriceAfterDiscount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? user;
  List<CartItems>? cartItems;
  num? discount;
  num? totalPrice;
  num? totalPriceAfterDiscount;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['user'] = user;
    if (cartItems != null) {
      map['cartItems'] = cartItems?.map((v) => v.toJson()).toList();
    }
    map['discount'] = discount;
    map['totalPrice'] = totalPrice;
    map['totalPriceAfterDiscount'] = totalPriceAfterDiscount;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
