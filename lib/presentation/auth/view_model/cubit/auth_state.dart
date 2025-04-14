// ignore_for_file: must_be_immutable

part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginInitial extends AuthState {}

final class LoginSuccessState extends AuthState {
  UserModel? userModel;

  LoginSuccessState({required this.userModel});
}

final class LoginLoadingState extends AuthState {}

final class LoginErrorState extends AuthState {
  String? message;

  LoginErrorState({required this.message});
}

final class CeckGuestState extends AuthState {
  final bool isGuest;

  CeckGuestState(this.isGuest);
}

///  FORGOT PASSWORD STATES  ///

final class SendEmailVerificationSuccessState extends AuthState {
  bool isSent;
  SendEmailVerificationSuccessState({required this.isSent});
}

final class SendEmailVerificationLoadingState extends AuthState {
  SendEmailVerificationLoadingState();
}

final class SendEmailVerificationErrorState extends AuthState {
  String? message;
  SendEmailVerificationErrorState({required this.message});
}

///  VERIFY RESET CODE STATES  ///

final class VerifyResetCodeSuccessState extends AuthState {
  bool isVerified;
  VerifyResetCodeSuccessState({required this.isVerified});
}

final class VerifyResetCodeLoadingState extends AuthState {
  VerifyResetCodeLoadingState();
}

final class VerifyResetCodeErrorState extends AuthState {
  String? message;
  VerifyResetCodeErrorState({required this.message});
}

///  PASSWORD RESET STATES  ///

final class ResetPasswordSuccessState extends AuthState {
  bool isChanged;
  ResetPasswordSuccessState({required this.isChanged});
}

final class ResetPasswordLoadingState extends AuthState {
  ResetPasswordLoadingState();
}

final class ResetPasswordErrorState extends AuthState {
  String? message;
  ResetPasswordErrorState({required this.message});
}

final class RegisterViewModelLoading extends AuthState {}

final class RegisterViewModelSuccess extends AuthState {
  final AuthResponseEntity response;

  RegisterViewModelSuccess(this.response);
}

final class RegisterViewModelFailure extends AuthState {
  final String error;

  RegisterViewModelFailure(this.error);
}

///  LOGOUT STATES  ///


class LogoutLoadingState extends AuthState {}

class LogoutSuccessState extends AuthState {}

class LogoutFailureState extends AuthState {
  final String message;
  LogoutFailureState({required this.message});
}
