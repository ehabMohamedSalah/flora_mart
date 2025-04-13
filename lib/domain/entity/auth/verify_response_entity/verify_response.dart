/// status : "Success"
/// message : "Reset code is invalid or has expired"
/// code : 400

// ignore_for_file: dangling_library_doc_comments

class VerifyResponseEntity {
  VerifyResponseEntity({
    this.status,
    this.message,
    this.code,
  });

  String? status;
  String? message;
  int? code;
}
