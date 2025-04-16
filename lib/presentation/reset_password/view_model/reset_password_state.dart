// ignore_for_file: must_be_immutable

part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordSuccessState extends ResetPasswordState {
  bool? isReset;

  ResetPasswordSuccessState({required this.isReset});
}

final class ResetPasswordLoadingState extends ResetPasswordState {}

final class ResetPasswordErrorState extends ResetPasswordState {
  String? message;

  ResetPasswordErrorState({required this.message});
}
