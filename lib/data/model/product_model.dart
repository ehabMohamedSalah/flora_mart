
import '../../domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required String id,
    required String title,
    required String slug,
    required String description,
    required String imgCover,
    required List<String> images,
    required double price,
    required double priceAfterDiscount,
    required int quantity,
    required String category,
    required String occasion,
    required String createdAt,
    required String updatedAt,
    required int discount,
    required int sold,
    required double rateAvg,
    required int rateCount,
  }) : super(
    id: id,
    title: title,
    slug: slug,
    description: description,
    imgCover: imgCover,
    images: images,
    price: price,
    priceAfterDiscount: priceAfterDiscount,
    quantity: quantity,
    category: category,
    occasion: occasion,
    createdAt: createdAt,
    updatedAt: updatedAt,
    discount: discount,
    sold: sold,
    rateAvg: rateAvg,
    rateCount: rateCount,
  );

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
