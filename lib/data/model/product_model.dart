import '../../domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.slug,
    required super.description,
    required super.imgCover,
    required super.images,
    required super.price,
    required super.priceAfterDiscount,
    required super.quantity,
    required super.category,
    required super.occasion,
    required super.createdAt,
    required super.updatedAt,
    required super.discount,
    required super.sold,
    required super.rateAvg,
    required super.rateCount,
  });

  /// ✅ **تحويل من JSON إلى Model**
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["_id"],
      title: json["title"],
      slug: json["slug"],
      description: json["description"],
      imgCover: json["imgCover"],
      images: List<String>.from(json["images"]),
      price: (json["price"] as num).toDouble(),
      priceAfterDiscount: (json["priceAfterDiscount"] as num).toDouble(),
      quantity: json["quantity"],
      category: json["category"],
      occasion: json["occasion"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      discount: json["discount"],
      sold: json["sold"],
      rateAvg: (json["rateAvg"] as num).toDouble(),
      rateCount: json["rateCount"],
    );
  }

  /// ✅ **تحويل من Model إلى JSON**
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "title": title,
      "slug": slug,
      "description": description,
      "imgCover": imgCover,
      "images": images,
      "price": price,
      "priceAfterDiscount": priceAfterDiscount,
      "quantity": quantity,
      "category": category,
      "occasion": occasion,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "discount": discount,
      "sold": sold,
      "rateAvg": rateAvg,
      "rateCount": rateCount,
    };
  }
}
