/// currentPage : 1
/// totalPages : 1
/// limit : 40
/// totalItems : 12

// ignore_for_file: dangling_library_doc_comments, file_names

class Metadata {
  Metadata({
    this.currentPage,
    this.totalPages,
    this.limit,
    this.totalItems,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    limit = json['limit'];
    totalItems = json['totalItems'];
  }
  num? currentPage;
  num? totalPages;
  num? limit;
  num? totalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['totalPages'] = totalPages;
    map['limit'] = limit;
    map['totalItems'] = totalItems;
    return map;
  }
}
