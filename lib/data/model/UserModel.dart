import 'package:flora_mart/data/model/User.dart';

/// message : "success"
/// user : {"_id":"67ddc3df836ee8be70625150","firstName":"kareem","lastName":"hekal","email":"kareemhekal19@gmail.com","gender":"male","phone":"+201023732207","photo":"https://flower.elevateegy.com/uploads/default-profile.png","role":"user","wishlist":[],"addresses":[],"createdAt":"2025-03-21T19:54:07.985Z"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjdkZGMzZGY4MzZlZThiZTcwNjI1MTUwIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDI4NTA0MTZ9.pLiDjQ8h8mUJp-pGcqF9CE3heFwr0uxwVpE9IYx79jo"

class UserModel {
  UserModel({
      this.message, 
      this.user, 
      this.token,});

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// _id : "67ddc3df836ee8be70625150"
/// firstName : "kareem"
/// lastName : "hekal"
/// email : "kareemhekal19@gmail.com"
/// gender : "male"
/// phone : "+201023732207"
/// photo : "https://flower.elevateegy.com/uploads/default-profile.png"
/// role : "user"
/// wishlist : []
/// addresses : []
/// createdAt : "2025-03-21T19:54:07.985Z"

