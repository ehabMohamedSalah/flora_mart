import 'package:flora_mart/domain/entity/categories_entity/all_categories_entity/categories_entity.dart';

/// _id : "673c46fd1159920171827c85"
/// name : "flowers"
/// slug : "flowers"
/// image : "https://flower.elevateegy.com/uploads/39c641a6-4ec4-421a-8f55-5d8f5eeba5c3-flowers.png"
/// createdAt : "2024-11-19T08:06:21.263Z"
/// updatedAt : "2024-11-19T08:06:21.263Z"
/// productsCount : 8

class Categories {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  num? productsCount;

  Categories(
      {this.id,
      this.image,
      this.name,
      this.updatedAt,
      this.slug,
      this.createdAt,
      this.productsCount});

  Categories.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productsCount = json['productsCount'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['productsCount'] = productsCount;
    return map;
  }

  CategoriesEntity toCategoriesEntity() {
    return CategoriesEntity(
      id: id,
      name: name,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
      productsCount: productsCount,
    );
  }

  factory Categories.fromEntity(CategoriesEntity entity) {
    return Categories(
      id: entity.id,
      name: entity.name,
      slug: entity.slug,
      image: entity.image,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      productsCount: entity.productsCount,
    );
  }

}
