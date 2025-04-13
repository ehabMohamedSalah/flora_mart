/// message : "success"
/// info : "OTP sent to your email"
/// code : 404

// ignore_for_file: dangling_library_doc_comments

class ForgetPasswordEntity {
  ForgetPasswordEntity({
    this.message,
    this.info,
    this.code,
  });

  String? message;
  String? info;
  int? code;
}
