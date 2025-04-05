
import '../../../../domain/entity/auth/foreget_pass_entity/forget_pass_entity.dart';

/// message : "success"
/// info : "OTP sent to your email"
/// code : 404

class ForgetPasswordResponse {
  ForgetPasswordResponse({
      this.message, 
      this.info, 
      this.code,});

  ForgetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
    code = json['code'];
  }
  String? message;
  String? info;
  int? code;
ForgetPasswordResponse copyWith({  String? message,
  String? info,
  int? code,
}) => ForgetPasswordResponse(  message: message ?? this.message,
  info: info ?? this.info,
  code: code ?? this.code,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    map['code'] = code;
    return map;
  }

  ForgetPasswordEntity toForgetPasswordEntity(){
    return ForgetPasswordEntity(
      code: code,
      message: message,
      info: info,

    );
  }

}