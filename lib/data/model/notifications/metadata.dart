class Metadata {
  final int currentPage;
  final int totalPages;
  final int limit;
  final int totalItems;

  Metadata({
    required this.currentPage,
    required this.totalPages,
    required this.limit,
    required this.totalItems,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      limit: json['limit'],
      totalItems: json['totalItems'],
    );
  }
}