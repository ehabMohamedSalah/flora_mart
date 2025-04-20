/// shipping_details : null

class CollectedInformation {
  CollectedInformation({
      this.shippingDetails,});

  CollectedInformation.fromJson(dynamic json) {
    shippingDetails = json['shipping_details'];
  }
  dynamic shippingDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shipping_details'] = shippingDetails;
    return map;
  }

}