class Address {
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;
  String? username;
  String? sId;

  Address(
      {this.street,
      this.phone,
      this.city,
      this.lat,
      this.long,
      this.username,
      this.sId});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];
    lat = json['lat'];
    long = json['long'];
    username = json['username'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['username'] = this.username;
    data['_id'] = this.sId;
    return data;
  }
}
