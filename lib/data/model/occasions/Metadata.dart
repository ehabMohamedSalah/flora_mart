/// currentPage : 1
/// limit : 10
/// totalPages : 2
/// totalItems : 15

// ignore_for_file: dangling_library_doc_comments, file_names

class Metadata {
  Metadata({
    this.currentPage,
    this.limit,
    this.totalPages,
    this.totalItems,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
  }
  int? currentPage;
  int? limit;
  int? totalPages;
  int? totalItems;
  Metadata copyWith({
    int? currentPage,
    int? limit,
    int? totalPages,
    int? totalItems,
  }) =>
      Metadata(
        currentPage: currentPage ?? this.currentPage,
        limit: limit ?? this.limit,
        totalPages: totalPages ?? this.totalPages,
        totalItems: totalItems ?? this.totalItems,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['limit'] = limit;
    map['totalPages'] = totalPages;
    map['totalItems'] = totalItems;
    return map;
  }
}
