import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/usecase/reset_password_Usecase.dart';
import 'package:flora_mart/presentation/reset_password/view_model/reset_password_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUsecase resetPasswordUsecase;

  ResetPasswordCubit(this.resetPasswordUsecase) : super(ResetPasswordInitial());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  void doIntent(ResetPasswordIntents resetPasswordIntent) {
    switch (resetPasswordIntent) {
      case ResetPasswordIntent():
        _resetPassword(intent: resetPasswordIntent);
        break;
    }
  }

  void _resetPassword({required ResetPasswordIntent intent}) async {
    emit(ResetPasswordLoadingState());
    final result = await resetPasswordUsecase.invoke(
      oldPassword: intent.oldPassword,
      newPassword: intent.newPassword,
    );
    switch (result) {
      case SuccessApiResult():
        emit(ResetPasswordSuccessState(isReset: result.data));
        break;
      case ErrorApiResult():
        print("${result.exception.toString()} Error ⛔⛔");
        emit(ResetPasswordErrorState(message: result.exception.toString()));
        break;
    }
  }
}
