/// _id : "673e1cd711599201718280fb"
/// title : "Wdding Flower"
/// slug : "wdding-flower"
/// description : "This is a Pack of White Widding Flowers"
/// imgCover : "https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png"
/// images : ["https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png","https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png","https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"]
/// price : 440
/// priceAfterDiscount : 100
/// quantity : 3946
/// category : "673c46fd1159920171827c85"
/// occasion : "673b34c21159920171827ae0"
/// createdAt : "2024-11-20T17:31:03.303Z"
/// updatedAt : "2025-04-06T17:11:19.132Z"
/// __v : 0
/// discount : 50
/// sold : 716
/// rateAvg : 3.5
/// rateCount : 30
/// id : "673e1cd711599201718280fb"

class Products {
  Products({
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
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
    this.id,
  });

  Products.fromJson(dynamic json) {
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
    discount = json['discount'];
    sold = json['sold'];
    rateAvg = json['rateAvg'];
    rateCount = json['rateCount'];
  }

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
  num? discount;
  num? sold;
  num? rateAvg;
  num? rateCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    map['discount'] = discount;
    map['sold'] = sold;
    map['rateAvg'] = rateAvg;
    map['rateCount'] = rateCount;
    return map;
  }
}
