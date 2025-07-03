class Product {
  Product({
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
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
  });

  Product.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
    images = json['images'] != null ? List<String>.from(json['images']) : [];
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
    id = json['id'];
  }

  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  num? price; // Changed to num to support both int and double
  num? priceAfterDiscount; // Changed to num to support both int and double
  num? quantity; // Changed to num to support both int and double
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  num? v; // Changed to num to support both int and double
  num? discount; // Changed to num to support both int and double
  num? sold; // Changed to num to support both int and double
  num? rateAvg; // Changed to num to support both int and double
  num? rateCount; // Changed to num to support both int and double

  Product copyWith({
    String? id,
    String? title,
    String? slug,
    String? description,
    String? imgCover,
    List<String>? images,
    num? price,
    num? priceAfterDiscount,
    num? quantity,
    String? category,
    String? occasion,
    String? createdAt,
    String? updatedAt,
    num? v,
    num? discount,
    num? sold,
    num? rateAvg,
    num? rateCount,
  }) => Product(
    id: id ?? this.id,
    title: title ?? this.title,
    slug: slug ?? this.slug,
    description: description ?? this.description,
    imgCover: imgCover ?? this.imgCover,
    images: images ?? this.images,
    price: price ?? this.price,
    priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
    quantity: quantity ?? this.quantity,
    category: category ?? this.category,
    occasion: occasion ?? this.occasion,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
    discount: discount ?? this.discount,
    sold: sold ?? this.sold,
    rateAvg: rateAvg ?? this.rateAvg,
    rateCount: rateCount ?? this.rateCount,
  );

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
    map['id'] = id;
    return map;
  }
}
