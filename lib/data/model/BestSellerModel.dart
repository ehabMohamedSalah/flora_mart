import 'package:flora_mart/data/model/products/Products.dart';

class BestSellerModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String imgCover;
  final List<String> images;
  final double price;
  final double priceAfterDiscount;
  final int quantity;
  final String category;
  final String occasion;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int discount;
  final int sold;
  final double rateAvg;
  final int rateCount;

  BestSellerModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.imgCover,
    required this.images,
    required this.price,
    required this.priceAfterDiscount,
    required this.quantity,
    required this.category,
    required this.occasion,
    required this.createdAt,
    required this.updatedAt,
    required this.discount,
    required this.sold,
    required this.rateAvg,
    required this.rateCount,
  });

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      imgCover: json['imgCover'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      price: (json['price'] ?? 0).toDouble(),
      priceAfterDiscount: (json['priceAfterDiscount'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 0,
      category: json['category'] ?? '',
      occasion: json['occasion'] ?? '',
      createdAt:
          DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt:
          DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      discount: json['discount'] ?? 0,
      sold: json['sold'] ?? 0,
      rateAvg: (json['rateAvg'] ?? 0).toDouble(),
      rateCount: json['rateCount'] ?? 0,
    );
  }

  Products toProduct() {
    return Products(
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
      discount: discount,
      rateAvg: rateAvg,
      rateCount: rateCount,
    );
  }
}
