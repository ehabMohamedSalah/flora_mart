///  Auth Intent ///
// ignore_for_file: non_constant_identifier_names, dangling_library_doc_comments

sealed class ResetPasswordIntents {}

class ResetPasswordIntent extends ResetPasswordIntents {
  final String oldPassword;
  final String newPassword;

  ResetPasswordIntent({
    required this.newPassword,
    required this.oldPassword,
  });
}
