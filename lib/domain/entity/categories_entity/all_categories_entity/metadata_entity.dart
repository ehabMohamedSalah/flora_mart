/// currentPage : 1
/// limit : 10
/// totalPages : 12
/// totalItems : 119

class MetadataEntity {
  num? currentPage;
  num? limit;
  num? totalPages;
  num? totalItems;

  MetadataEntity(
      {this.totalPages, this.currentPage, this.totalItems, this.limit});
}
