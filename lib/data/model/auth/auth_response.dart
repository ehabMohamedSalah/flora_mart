import 'package:flora_mart/domain/entity/auth/auth_response_entity.dart';

import 'user.dart';

/// message : "success"
/// user : {"firstName":"Mariam","lastName":"Shahir","email":"mariamshahir2000@gmail.com","gender":"female","phone":"+201554195222","photo":"default-profile.png","role":"user","wishlist":[],"_id":"67dfe0e1836ee8be7062578c","addresses":[],"createdAt":"2025-03-23T10:22:25.485Z"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjdkZmUwZTE4MzZlZThiZTcwNjI1NzhjIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDI3MjUzNDV9.tnQd8i62I5YD02XhQrKQMhKTESFBvFuhs_nXoM71HKQ"

class AuthResponse {
  String? message;
  User? user;
  String? token;

  AuthResponse({this.message, this.token, this.user});

  factory AuthResponse.fromJson(dynamic json) {
    return AuthResponse(
      message: json['message'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "user": user?.toJson(),
      "token": token,
    };
  }

  AuthResponseEntity toLoginResponseEntity() {
    return AuthResponseEntity(
      message: message,
      user: user?.toUserEntity(),
      token: token,
    );
  }
}
