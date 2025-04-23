/// message : "success"
/// addresses : [{"street":"Home","phone":"01010700700","city":"Gizaa","lat":"z","long":"z","username":"ahmedmuti","_id":"680791041433a666c8d1ead0"}]

class GetSavedAddressResponce {
  GetSavedAddressResponce({
    this.message,
    this.addresses,
  });

  GetSavedAddressResponce.fromJson(dynamic json) {
    message = json['message'];
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses?.add(Addresses.fromJson(v));
      });
    }
  }

  String? message;
  List<Addresses>? addresses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (addresses != null) {
      map['addresses'] = addresses?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// street : "Home"
/// phone : "01010700700"
/// city : "Gizaa"
/// lat : "z"
/// long : "z"
/// username : "ahmedmuti"
/// _id : "680791041433a666c8d1ead0"

class Addresses {
  Addresses({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
    this.area,
  });

  Addresses.fromJson(dynamic json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];
    lat = json['lat'];
    long = json['long'];
    username = json['username'];
    id = json['_id'];
    area = json['area'];
  }

  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;
  String? username;
  String? id;
  String? area;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['phone'] = phone;
    map['city'] = city;
    map['lat'] = lat;
    map['long'] = long;
    map['username'] = username;
    map['_id'] = id;
    map['area'] = area;
    return map;
  }
}
