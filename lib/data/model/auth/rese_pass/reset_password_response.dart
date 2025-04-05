
import '../../../../domain/entity/auth/reset_pass_response_entity/reset_passowrd_response_entity.dart';

/// message : "reset code not verified"
/// code : 400
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjI0Y2Q1ODZhMDI0ZjA2ZWEyNzc3YyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5ODU2NDIyfQ.xXnCxBWkjHgYf1dPEuX6MfqIF7aBg8Vg2GGBG_W_DEM"

class ResetPasswordResponse {
  ResetPasswordResponse({
      this.message, 
      this.code, 
      this.token,});

  ResetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
    token = json['token'];
  }
  String? message;
  int? code;
  String? token;
ResetPasswordResponse copyWith({  String? message,
  int? code,
  String? token,
}) => ResetPasswordResponse(  message: message ?? this.message,
  code: code ?? this.code,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    map['token'] = token;
    return map;
  }

  ResetPasswordResponseEntity toResetPasswordResponseEntity(){
    return ResetPasswordResponseEntity(
      message: message,
      code: code,
      token: token,
    );
  }
}