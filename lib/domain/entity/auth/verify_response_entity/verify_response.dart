/// status : "Success"
/// message : "Reset code is invalid or has expired"
/// code : 400

class VerifyResponseEntity {
  VerifyResponseEntity({
    this.status,
    this.message,
    this.code,});

   String? status;
  String? message;
  int? code;


}