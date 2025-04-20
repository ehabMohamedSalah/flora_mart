/// id : "pmc_1MphffE0S7VoKZmPNNp2G77I"
/// parent : null

class PaymentMethodConfigurationDetails {
  PaymentMethodConfigurationDetails({
      this.id, 
      this.parent,});

  PaymentMethodConfigurationDetails.fromJson(dynamic json) {
    id = json['id'];
    parent = json['parent'];
  }
  String? id;
  dynamic parent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['parent'] = parent;
    return map;
  }

}