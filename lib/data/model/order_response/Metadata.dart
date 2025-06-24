/// currentPage : 1
/// totalPages : 1
/// limit : 40
/// totalItems : 12

class Metadata {
  Metadata({
      this.currentPage, 
      this.totalPages, 
      this.limit, 
      this.totalItems,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    limit = json['limit'];
    totalItems = json['totalItems'];
  }
  int? currentPage;
  int? totalPages;
  int? limit;
  int? totalItems;
Metadata copyWith({  int? currentPage,
  int? totalPages,
  int? limit,
  int? totalItems,
}) => Metadata(  currentPage: currentPage ?? this.currentPage,
  totalPages: totalPages ?? this.totalPages,
  limit: limit ?? this.limit,
  totalItems: totalItems ?? this.totalItems,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['totalPages'] = totalPages;
    map['limit'] = limit;
    map['totalItems'] = totalItems;
    return map;
  }

}