/// _id : "673c46fd1159920171827c85"
/// name : "flowers"
/// slug : "flowers"
/// image : "https://flower.elevateegy.com/uploads/39c641a6-4ec4-421a-8f55-5d8f5eeba5c3-flowers.png"
/// createdAt : "2024-11-19T08:06:21.263Z"
/// updatedAt : "2024-11-19T08:06:21.263Z"
/// productsCount : 8

class CategoriesEntity {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  num? productsCount;

  CategoriesEntity(
      {this.id,
      this.name,
      this.slug,
      this.createdAt,
      this.image,
      this.productsCount,
      this.updatedAt});
  @override
  String toString() {
    return 'CategoriesEntity{id: $id, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, productsCount: $productsCount}';
  }

}
