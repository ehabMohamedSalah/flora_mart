


import 'package:flora_mart/domain/entity/auth/user_entity.dart';

/// message : "success"
/// code : 200
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YWY3MTA1ODZhMDI0ZjA2ZWEyNmEzMSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5NTUxMjc3fQ.CUG4hwcVeqt7vO9nhR0T5Vag8b2RmdQWYzTi8SLiOOY"
/// user : {"_id":"67af710586a024f06ea26a31","username":"ehabsalah","firstName":"ehab","lastName":"salah","email":"ehabsalah@gmail.com","phone":"01143668719","role":"user","isVerified":false,"createdAt":"2025-02-14T16:36:21.143Z"}

class AuthResponseEntity {
  AuthResponseEntity({
    this.message,
    this.code,
    this.token,
    this.user,});

   String? message;
  int? code;
  String? token;
  UserEntity? user;


}