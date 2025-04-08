class ProductEntity {
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
  final String createdAt;
  final String updatedAt;
  final int discount;
  final int sold;
  final double rateAvg;
  final int rateCount;

  const ProductEntity({
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
}
