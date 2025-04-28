/// rateAvg : 5
/// rateCount : 0
/// _id : "673e2bd91159920171828139"
/// title : "Red Wdding Flower"
/// slug : "red-wdding-flower"
/// description : "This is a Pack of Red Widding Flowers"
/// imgCover : "https://flower.elevateegy.com/uploads/5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png"
/// images : ["https://flower.elevateegy.com/uploads/ba028e59-410f-43ac-aed5-f4f97c102b98-image_four.png","https://flower.elevateegy.com/uploads/f89bc954-eb0d-4efb-928f-6717f77b69ed-image_one.png","https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png","https://flower.elevateegy.com/uploads/c0992ec6-d3c0-4a54-b7ec-4cf000138367-image_two.png"]
/// price : 250
/// priceAfterDiscount : 150
/// quantity : 657
/// category : "673c46fd1159920171827c85"
/// occasion : "673b34c21159920171827ae0"
/// createdAt : "2024-11-20T18:35:05.594Z"
/// updatedAt : "2025-04-12T04:52:08.256Z"
/// __v : 0
/// sold : 343
/// discount : 50
/// id : "673e2bd91159920171828139"
// ignore_for_file: file_names

library;

import 'package:flora_mart/data/model/products/Products.dart';

class Product {
  Product({
    this.rateAvg,
    this.rateCount,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.sold,
    this.discount,
  });

  Product.fromJson(dynamic json) {
    rateAvg = json['rateAvg'];
    rateCount = json['rateCount'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    quantity = json['quantity'];
    category = json['category'];
    occasion = json['occasion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    sold = json['sold'];
    discount = json['discount'];
  }
  num? rateAvg;
  num? rateCount;
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  num? price;
  num? priceAfterDiscount;
  num? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? sold;
  num? discount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rateAvg'] = rateAvg;
    map['rateCount'] = rateCount;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['imgCover'] = imgCover;
    map['images'] = images;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['quantity'] = quantity;
    map['category'] = category;
    map['occasion'] = occasion;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['sold'] = sold;
    map['discount'] = discount;
    return map;
  }

//adada
  toProducts() {
    return Products(
      category: category,
      description: description,
      discount: discount,
      id: id,
      imgCover: imgCover,
      images: images,
      occasion: occasion,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      rateAvg: rateAvg,
      rateCount: rateCount,
      sold: sold,
      title: title,
      v: v,
      createdAt: createdAt,
      slug: slug,
      updatedAt: updatedAt,
    );
  }
}
