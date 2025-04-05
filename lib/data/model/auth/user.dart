import 'package:flora_mart/domain/entity/auth/user_entity.dart';

/// firstName : "Mariam"
/// lastName : "Shahir"
/// email : "mariamshahir2000@gmail.com"
/// gender : "female"
/// phone : "+201554195222"
/// photo : "default-profile.png"
/// role : "user"
/// wishlist : []
/// _id : "67dfe0e1836ee8be7062578c"
/// addresses : []
/// createdAt : "2025-03-23T10:22:25.485Z"

class User {
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  List<dynamic>? wishlist;
  String? id;
  List<dynamic>? addresses;
  String? createdAt;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.id,
    this.addresses,
    this.createdAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    role = json['role'];
    wishlist = json['wishlist'] ?? [];
    id = json['_id'];
    addresses = json['addresses'] ?? [];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
      'phone': phone,
      'photo': photo,
      'role': role,
      'wishlist': wishlist,
      '_id': id,
      'addresses': addresses,
      'createdAt': createdAt,
    };
  }

  UserEntity toUserEntity() {
    return UserEntity(
      email: email,
      gender: gender,
      id: id,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      role: role,
    );
  }
}
