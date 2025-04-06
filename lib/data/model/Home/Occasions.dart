/// _id : "673b34c21159920171827ae0"
/// name : "Wedding"
/// slug : "wedding"
/// image : "https://flower.elevateegy.com/uploads/da6919e9-6d7b-4e1e-9578-1c5b6fd098b2-sofia-hernandez-8cCfjxR8KTw-unsplash.jpg"
/// createdAt : "2024-11-18T12:36:18.366Z"
/// updatedAt : "2024-11-18T12:36:18.366Z"

class Occasions {
  Occasions({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  Occasions.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
