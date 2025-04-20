/// city : "Cairo"
/// lat : "String"
/// long : "String"
/// phone : "01010700999"
/// street : "details"

class Metadata {
  Metadata({
      this.city, 
      this.lat, 
      this.long, 
      this.phone, 
      this.street,});

  Metadata.fromJson(dynamic json) {
    city = json['city'];
    lat = json['lat'];
    long = json['long'];
    phone = json['phone'];
    street = json['street'];
  }
  String? city;
  String? lat;
  String? long;
  String? phone;
  String? street;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['lat'] = lat;
    map['long'] = long;
    map['phone'] = phone;
    map['street'] = street;
    return map;
  }

}