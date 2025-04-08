import 'package:flora_mart/domain/entity/categories_entity/all_categories_entity/metadata_entity.dart';

/// currentPage : 1
/// limit : 10
/// totalPages : 12
/// totalItems : 119

class Metadata {
  num? currentPage;
  num? limit;
  num? totalPages;
  num? totalItems;

  Metadata({this.totalPages, this.currentPage, this.totalItems, this.limit});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['limit'] = limit;
    map['totalPages'] = totalPages;
    map['totalItems'] = totalItems;
    return map;
  }

  MetadataEntity toMetadataEntity() {
    return MetadataEntity(
      currentPage: currentPage,
      limit: limit,
      totalPages: totalPages,
      totalItems: totalItems,
    );
  }
}
