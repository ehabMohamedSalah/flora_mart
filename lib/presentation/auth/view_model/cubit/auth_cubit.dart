import 'dart:developer';

import 'package:flora_mart/domain/common/result.dart';
import 'package:flora_mart/domain/entity/auth/auth_response_entity.dart';
import 'package:flora_mart/domain/usecase/changeGuest_usecase.dart';
import 'package:flora_mart/domain/usecase/check_guest_usecase.dart';
import 'package:flora_mart/domain/usecase/register_usecase.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {

  final RegisterUsecase registerUsecase;
  final CheckGuestUseCase checkGuestUseCase;
  final ChangeguestUsecase changeGuestUsecase;

  @factoryMethod
  AuthCubit(
      this.checkGuestUseCase, this.changeGuestUsecase, this.registerUsecase)
      : super(AuthInitial());

  void doIntent(AuthIntent authIntent) {
    switch (authIntent) {
      case CheckGuestIntent():
        _checkGuest();
        break;
      case ChangeGuestIntent():
        _changeGuest(intent: authIntent);
        break;
      case RegisterUserIntent():
        _register(intent: authIntent);
        break;
    }
  }

  static AuthCubit get(context) => BlocProvider.of(context);

  bool? isguest = false;

  _checkGuest() async {
    var result = await checkGuestUseCase.call();
    switch (result) {
      case Success():
        isguest = result.data;
        log("in cubit result: ${result.data}");
        emit(CeckGuestState(result.data ?? false));
        break;
      default:
        emit(CeckGuestState(false));
    }
  }

  _changeGuest({required ChangeGuestIntent intent}) async {
    bool success = await changeGuestUsecase.call(isGuest: intent.isGuest);
    if (success) {
      return _checkGuest();
    } else {
      log("Failed to change guest status");
      emit(CeckGuestState(isguest ?? false)); // ❌ إبقاء الحالة كما هي دون تغيير
    }
  }

  _register({required RegisterUserIntent intent}) async {
    emit(RegisterViewModelLoading());

    final result = await registerUsecase(
      firstName: intent.firstName,
      lastName: intent.lastName,
      email: intent.email,
      password: intent.password,
      rePassword: intent.rePassword,
      phone: intent.phone,
      gender: intent.gender,
    );

    result.fold(
          (failureMessage) => emit(RegisterViewModelFailure(failureMessage)),
          (response) {
        emit(RegisterViewModelSuccess(response)); // ✅ `response` الآن هو `AuthResponseEntity`
      },
    );
  }
}
