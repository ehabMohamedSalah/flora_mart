
import '../../../../domain/entity/auth/verify_response_entity/verify_response.dart';

/// status : "Success"
/// message : "Reset code is invalid or has expired"
/// code : 400

class VerifyResetCodeResponse {
  VerifyResetCodeResponse({
      this.status, 
      this.message, 
      this.code,});

  VerifyResetCodeResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }
  String? status;
  String? message;
  int? code;
  VerifyResetCodeResponse copyWith({  String? status,
  String? message,
  int? code,
}) => VerifyResetCodeResponse(  status: status ?? this.status,
  message: message ?? this.message,
  code: code ?? this.code,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['code'] = code;
    return map;
  }

  VerifyResponseEntity toVerifyResponseEntity(){
    return VerifyResponseEntity(
      message: message,
      code:code,
      status: status,
    );
  }

}