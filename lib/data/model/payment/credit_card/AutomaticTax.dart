/// enabled : false
/// liability : null
/// provider : null
/// status : null

class AutomaticTax {
  AutomaticTax({
      this.enabled, 
      this.liability, 
      this.provider, 
      this.status,});

  AutomaticTax.fromJson(dynamic json) {
    enabled = json['enabled'];
    liability = json['liability'];
    provider = json['provider'];
    status = json['status'];
  }
  bool? enabled;
  dynamic liability;
  dynamic provider;
  dynamic status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enabled'] = enabled;
    map['liability'] = liability;
    map['provider'] = provider;
    map['status'] = status;
    return map;
  }

}