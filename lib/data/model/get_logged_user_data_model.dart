import 'package:flora_mart/data/model/User.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';

/// message : "success"
/// user : {"_id":"67dfe0e1836ee8be7062578c","firstName":"Mariam","lastName":"Shahir","email":"mariamshahir2000@gmail.com","gender":"female","phone":"+201554195222","GetLoggedUserDataModel":"https://flower.elevateegy.com/uploads/default-profile.png","role":"user","wishlist":[],"addresses":[],"createdAt":"2025-03-23T10:22:25.485Z"}

class GetLoggedUserDataModel {
  String? message;
  User? user;

  GetLoggedUserDataModel({this.message, this.user});

  GetLoggedUserDataModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    return map;
  }

  GetLoggedUserDataEntity toGetLoggedUserDataEntity() {
    return GetLoggedUserDataEntity(
      message: message,
      user: user?.toUserEntity(),
    );
  }
}
