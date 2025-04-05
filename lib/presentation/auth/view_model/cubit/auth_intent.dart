///  Auth Intent ///
sealed class AuthIntent {}
class SignInIntent extends AuthIntent {
  final String email;
  final bool rememberMe;
  final String password;

  SignInIntent({
    required this.rememberMe,
    required this.email,
    required this.password,
  });
}

class CheckGuestIntent extends AuthIntent {}

class ChangeGuestIntent extends AuthIntent {
  final bool isGuest;

  ChangeGuestIntent({required this.isGuest});
}
class CheckAuthIntent extends AuthIntent {}

class RegisterUserIntent extends AuthIntent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;
  final String gender;

  RegisterUserIntent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
    required this.gender,
  });
}

///  FORGOT PASSWORD INTENT ///
class ForgetPassword extends AuthIntent {
  final String email;

  ForgetPassword({required this.email});
}

///  VERIFY RESET CODE INTENT ///
class VerifyResetCode extends AuthIntent {
  final String resetCode;

  VerifyResetCode({required this.resetCode});
}

///  RESET PASSWORD INTENT ///
class ResetPassword extends AuthIntent {
  final String email;
  final String NewPassword;

  ResetPassword({required this.email, required this.NewPassword});
}