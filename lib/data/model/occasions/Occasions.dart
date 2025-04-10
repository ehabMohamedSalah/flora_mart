/// _id : "673b34c21159920171827ae0"
/// name : "Wedding"
/// slug : "wedding"
/// image : "da6919e9-6d7b-4e1e-9578-1c5b6fd098b2-sofia-hernandez-8cCfjxR8KTw-unsplash.jpg"
/// createdAt : "2024-11-18T12:36:18.366Z"
/// updatedAt : "2024-11-18T12:36:18.366Z"
/// productsCount : 4
library;

class Occasions {
  Occasions({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt, 
      this.productsCount,});

  Occasions.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productsCount = json['productsCount'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? productsCount;
Occasions copyWith({  String? id,
  String? name,
  String? slug,
  String? image,
  String? createdAt,
  String? updatedAt,
  int? productsCount,
}) => Occasions(  id: id ?? this.id,
  name: name ?? this.name,
  slug: slug ?? this.slug,
  image: image ?? this.image,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  productsCount: productsCount ?? this.productsCount,
);
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

}