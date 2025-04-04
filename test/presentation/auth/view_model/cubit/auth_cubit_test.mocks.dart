// Mocks generated by Mockito 5.4.5 from annotations
// in flora_mart/test/presentation/auth/view_model/cubit/auth_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;

import 'package:flora_mart/core/api/api_result.dart' as _i14;
import 'package:flora_mart/data/model/UserModel.dart' as _i18;
import 'package:flora_mart/domain/common/result.dart' as _i10;
import 'package:flora_mart/domain/entity/auth/auth_response_entity.dart'
    as _i20;
import 'package:flora_mart/domain/repo_contract/auth_repo.dart' as _i7;
import 'package:flora_mart/domain/repo_contract/forget_password_repo_contract/forget_password_repo.dart'
    as _i3;
import 'package:flora_mart/domain/repo_contract/forget_password_repo_contract/reset_password_repo.dart'
    as _i5;
import 'package:flora_mart/domain/repo_contract/forget_password_repo_contract/verify_reset_code_repo.dart'
    as _i4;
import 'package:flora_mart/domain/repo_contract/guest_repo.dart' as _i2;
import 'package:flora_mart/domain/repo_contract/Login_Repo.dart' as _i6;
import 'package:flora_mart/domain/usecase/changeGuest_usecase.dart' as _i12;
import 'package:flora_mart/domain/usecase/check_guest_usecase.dart' as _i8;
import 'package:flora_mart/domain/usecase/forget_password_usecases/forget_password_usecase.dart'
    as _i13;
import 'package:flora_mart/domain/usecase/forget_password_usecases/reset_password_usecase.dart'
    as _i16;
import 'package:flora_mart/domain/usecase/forget_password_usecases/verify_reset_code_usecase.dart'
    as _i15;
import 'package:flora_mart/domain/usecase/login_Usecase.dart' as _i17;
import 'package:flora_mart/domain/usecase/register_usecase.dart' as _i19;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i11;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGuestRepo_0 extends _i1.SmartFake implements _i2.GuestRepo {
  _FakeGuestRepo_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeForgetpasswordRepo_1 extends _i1.SmartFake
    implements _i3.ForgetpasswordRepo {
  _FakeForgetpasswordRepo_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeVerifyresetcodeRepo_2 extends _i1.SmartFake
    implements _i4.VerifyresetcodeRepo {
  _FakeVerifyresetcodeRepo_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeResetpasswordRepo_3 extends _i1.SmartFake
    implements _i5.ResetpasswordRepo {
  _FakeResetpasswordRepo_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeLoginRepo_4 extends _i1.SmartFake implements _i6.LoginRepo {
  _FakeLoginRepo_4(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeAuthRepo_5 extends _i1.SmartFake implements _i7.AuthRepo {
  _FakeAuthRepo_5(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [CheckGuestUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCheckGuestUseCase extends _i1.Mock implements _i8.CheckGuestUseCase {
  MockCheckGuestUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GuestRepo get authRepo =>
      (super.noSuchMethod(
            Invocation.getter(#authRepo),
            returnValue: _FakeGuestRepo_0(this, Invocation.getter(#authRepo)),
          )
          as _i2.GuestRepo);

  @override
  _i9.Future<_i10.Result<bool>> call() =>
      (super.noSuchMethod(
            Invocation.method(#call, []),
            returnValue: _i9.Future<_i10.Result<bool>>.value(
              _i11.dummyValue<_i10.Result<bool>>(
                this,
                Invocation.method(#call, []),
              ),
            ),
          )
          as _i9.Future<_i10.Result<bool>>);
}

/// A class which mocks [ChangeguestUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockChangeguestUsecase extends _i1.Mock
    implements _i12.ChangeguestUsecase {
  MockChangeguestUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GuestRepo get authRepo =>
      (super.noSuchMethod(
            Invocation.getter(#authRepo),
            returnValue: _FakeGuestRepo_0(this, Invocation.getter(#authRepo)),
          )
          as _i2.GuestRepo);

  @override
  _i9.Future<bool> call({required bool? isGuest}) =>
      (super.noSuchMethod(
            Invocation.method(#call, [], {#isGuest: isGuest}),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);
}

/// A class which mocks [ForgetPasswordUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockForgetPasswordUseCase extends _i1.Mock
    implements _i13.ForgetPasswordUseCase {
  MockForgetPasswordUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.ForgetpasswordRepo get forgetPassword =>
      (super.noSuchMethod(
            Invocation.getter(#forgetPassword),
            returnValue: _FakeForgetpasswordRepo_1(
              this,
              Invocation.getter(#forgetPassword),
            ),
          )
          as _i3.ForgetpasswordRepo);

  @override
  set forgetPassword(_i3.ForgetpasswordRepo? _forgetPassword) =>
      super.noSuchMethod(
        Invocation.setter(#forgetPassword, _forgetPassword),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<_i14.ApiResult<bool>> invoke({required String? email}) =>
      (super.noSuchMethod(
            Invocation.method(#invoke, [], {#email: email}),
            returnValue: _i9.Future<_i14.ApiResult<bool>>.value(
              _i11.dummyValue<_i14.ApiResult<bool>>(
                this,
                Invocation.method(#invoke, [], {#email: email}),
              ),
            ),
          )
          as _i9.Future<_i14.ApiResult<bool>>);
}

/// A class which mocks [VerifyresetcodeUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockVerifyresetcodeUseCase extends _i1.Mock
    implements _i15.VerifyresetcodeUseCase {
  MockVerifyresetcodeUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.VerifyresetcodeRepo get repo =>
      (super.noSuchMethod(
            Invocation.getter(#repo),
            returnValue: _FakeVerifyresetcodeRepo_2(
              this,
              Invocation.getter(#repo),
            ),
          )
          as _i4.VerifyresetcodeRepo);

  @override
  set repo(_i4.VerifyresetcodeRepo? _repo) => super.noSuchMethod(
    Invocation.setter(#repo, _repo),
    returnValueForMissingStub: null,
  );

  @override
  _i9.Future<_i14.ApiResult<bool>> check({required String? code}) =>
      (super.noSuchMethod(
            Invocation.method(#check, [], {#code: code}),
            returnValue: _i9.Future<_i14.ApiResult<bool>>.value(
              _i11.dummyValue<_i14.ApiResult<bool>>(
                this,
                Invocation.method(#check, [], {#code: code}),
              ),
            ),
          )
          as _i9.Future<_i14.ApiResult<bool>>);
}

/// A class which mocks [ResetpasswordUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockResetpasswordUsecase extends _i1.Mock
    implements _i16.ResetpasswordUsecase {
  MockResetpasswordUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.ResetpasswordRepo get repo =>
      (super.noSuchMethod(
            Invocation.getter(#repo),
            returnValue: _FakeResetpasswordRepo_3(
              this,
              Invocation.getter(#repo),
            ),
          )
          as _i5.ResetpasswordRepo);

  @override
  set repo(_i5.ResetpasswordRepo? _repo) => super.noSuchMethod(
    Invocation.setter(#repo, _repo),
    returnValueForMissingStub: null,
  );

  @override
  _i9.Future<_i14.ApiResult<bool>> invoke({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#invoke, [], {
              #email: email,
              #password: password,
            }),
            returnValue: _i9.Future<_i14.ApiResult<bool>>.value(
              _i11.dummyValue<_i14.ApiResult<bool>>(
                this,
                Invocation.method(#invoke, [], {
                  #email: email,
                  #password: password,
                }),
              ),
            ),
          )
          as _i9.Future<_i14.ApiResult<bool>>);
}

/// A class which mocks [LoginUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUsecase extends _i1.Mock implements _i17.LoginUsecase {
  MockLoginUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.LoginRepo get loginRepo =>
      (super.noSuchMethod(
            Invocation.getter(#loginRepo),
            returnValue: _FakeLoginRepo_4(this, Invocation.getter(#loginRepo)),
          )
          as _i6.LoginRepo);

  @override
  _i9.Future<_i14.ApiResult<_i18.UserModel>> invoke({
    required String? email,
    required bool? rememberMe,
    required String? password,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#invoke, [], {
              #email: email,
              #rememberMe: rememberMe,
              #password: password,
            }),
            returnValue: _i9.Future<_i14.ApiResult<_i18.UserModel>>.value(
              _i11.dummyValue<_i14.ApiResult<_i18.UserModel>>(
                this,
                Invocation.method(#invoke, [], {
                  #email: email,
                  #rememberMe: rememberMe,
                  #password: password,
                }),
              ),
            ),
          )
          as _i9.Future<_i14.ApiResult<_i18.UserModel>>);
}

/// A class which mocks [RegisterUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockRegisterUsecase extends _i1.Mock implements _i19.RegisterUsecase {
  MockRegisterUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.AuthRepo get authRepo =>
      (super.noSuchMethod(
            Invocation.getter(#authRepo),
            returnValue: _FakeAuthRepo_5(this, Invocation.getter(#authRepo)),
          )
          as _i7.AuthRepo);

  @override
  _i9.Future<_i14.ApiResult<_i20.AuthResponseEntity>> call({
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? password,
    required String? rePassword,
    required String? phone,
    required String? gender,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#call, [], {
              #firstName: firstName,
              #lastName: lastName,
              #email: email,
              #password: password,
              #rePassword: rePassword,
              #phone: phone,
              #gender: gender,
            }),
            returnValue:
                _i9.Future<_i14.ApiResult<_i20.AuthResponseEntity>>.value(
                  _i11.dummyValue<_i14.ApiResult<_i20.AuthResponseEntity>>(
                    this,
                    Invocation.method(#call, [], {
                      #firstName: firstName,
                      #lastName: lastName,
                      #email: email,
                      #password: password,
                      #rePassword: rePassword,
                      #phone: phone,
                      #gender: gender,
                    }),
                  ),
                ),
          )
          as _i9.Future<_i14.ApiResult<_i20.AuthResponseEntity>>);
}
