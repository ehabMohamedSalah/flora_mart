import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flora_mart/data/model/auth/auth_response.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:flora_mart/domain/usecase/changeGuest_usecase.dart';
import 'package:flora_mart/domain/usecase/check_guest_usecase.dart';
import 'package:flora_mart/domain/usecase/register_usecase.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_intent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_cubit_test.mocks.dart';

@GenerateMocks([CheckGuestUseCase, ChangeguestUsecase, RegisterUsecase])
void main() {
  group(
    'AuthCubit',
    () {
      late CheckGuestUseCase checkGuestUseCase;
      late ChangeguestUsecase changeGuestUsecase;
      late AuthCubit authCubit;
      late RegisterUsecase registerUsecase;
      setUp(() {
        checkGuestUseCase = MockCheckGuestUseCase();
        changeGuestUsecase = MockChangeguestUsecase();
        registerUsecase = MockRegisterUsecase();
        authCubit =
            AuthCubit(checkGuestUseCase, changeGuestUsecase, registerUsecase);
      });
      blocTest<AuthCubit, AuthState>(
        'when call do intent with CheckGuestIntent it '
        ' should check guest and return correct state',
        build: () {
          var result = Success<bool>(true);
          provideDummy<Result<bool>>(result);
          when(checkGuestUseCase.call()).thenAnswer((_) async => result);
          return authCubit;
        },
        act: (cubit) {
          cubit.doIntent(CheckGuestIntent());
        },
        expect: () {
          return [
            isA<CeckGuestState>(),
          ];
        },
      );

      blocTest<AuthCubit, AuthState>(
        'when call do intent with ChangeGuestIntent it '
        ' should change guest and return correct state',
        build: () {
          var result = Success<bool>(true);
          var value = true;
          provideDummy<Result<bool>>(result);
          when(changeGuestUsecase.call(isGuest: true))
              .thenAnswer((_) async => value);
          when(checkGuestUseCase.call()).thenAnswer((_) async => result);
          return authCubit;
        },
        act: (cubit) {
          cubit.doIntent(ChangeGuestIntent(isGuest: true));
        },
        expect: () {
          return [
            isA<CeckGuestState>(),
          ];
        },
      );

      const String testFirstName = 'Mariam';
      const String testLastName = 'Shahir';
      const String testEmail = 'mariamshahir2000@gmail.com';
      const String testPassword = 'Mariam@123';
      const String testRePassword = 'Mariam@123';
      const String testPhone = '+201554195222';
      const String testGender = 'female';
      blocTest<AuthCubit, AuthState>(
        'emits [RegisterViewModelLoading, RegisterViewModelSuccess] when registration is successful',
        build: () {
          when(registerUsecase.call(
            firstName: testFirstName,
            lastName: testLastName,
            email: testEmail,
            password: testPassword,
            rePassword: testRePassword,
            phone: testPhone,
            gender: testGender,
          )).thenAnswer((_) async {
            final authResponse = AuthResponse(token: "dummy_token");
            return right(authResponse.toLoginResponseEntity());
          });

          return authCubit;
        },
        act: (cubit) => cubit.doIntent(RegisterUserIntent(
          firstName: testFirstName,
          lastName: testLastName,
          email: testEmail,
          password: testPassword,
          rePassword: testRePassword,
          phone: testPhone,
          gender: testGender,
        )),
        expect: () => [
          isA<RegisterViewModelLoading>(),
          isA<RegisterViewModelSuccess>(),
        ],
      );
    },
  );
}
