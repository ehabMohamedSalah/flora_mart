// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mockito/annotations.dart';
// import 'package:flora_mart/core/api/api_result.dart';
// import 'package:flora_mart/domain/entity/auth/auth_response_entity.dart';
// import 'package:flora_mart/domain/repo_contract/auth_repo.dart';
// import 'package:flora_mart/domain/usecase/register_usecase.dart';

// import 'register_usecase_test.mocks.dart';

// @GenerateMocks([AuthRepo])
// void main() {
//   late RegisterUsecase registerUsecase;
//   late MockAuthRepo mockAuthRepo;

//   setUp(() {
//     mockAuthRepo = MockAuthRepo();
//     registerUsecase = RegisterUsecase(mockAuthRepo);
//   });

//   const String firstName = 'Mariam';
//   const String lastName = 'Shahir';
//   const String email = 'mariamshahir2000@gmail.com';
//   const String password = 'Mariam@123';
//   const String rePassword = 'Mariam@123';
//   const String phone = '+201554195222';
//   const String gender = 'female';

//   final authResponse = AuthResponseEntity(token: 'dummy_token');

//   test('should return AuthResponseEntity when registration is successful',
//       () async {
//     when(mockAuthRepo.postRegister(
//       firstName: anyNamed('firstName'),
//       lastName: anyNamed('lastName'),
//       email: anyNamed('email'),
//       password: anyNamed('password'),
//       rePassword: anyNamed('rePassword'),
//       phone: anyNamed('phone'),
//       gender: anyNamed('gender'),
//     )).thenAnswer((_) async => SuccessApiResult(authResponse));

//     final result = await registerUsecase(
//       firstName: firstName,
//       lastName: lastName,
//       email: email,
//       password: password,
//       rePassword: rePassword,
//       phone: phone,
//       gender: gender,
//     );

//     expect(result, isA<SuccessApiResult<AuthResponseEntity>>());
//     expect((result as SuccessApiResult).data, authResponse);
//     verify(mockAuthRepo.postRegister(
//       firstName: firstName,
//       lastName: lastName,
//       email: email,
//       password: password,
//       rePassword: rePassword,
//       phone: phone,
//       gender: gender,
//     ));
//     verifyNoMoreInteractions(mockAuthRepo);
//   });

//   test('should return error message when registration fails', () async {
//     final exception = Exception('Registration failed');
//     when(mockAuthRepo.postRegister(
//       firstName: anyNamed('firstName'),
//       lastName: anyNamed('lastName'),
//       email: anyNamed('email'),
//       password: anyNamed('password'),
//       rePassword: anyNamed('rePassword'),
//       phone: anyNamed('phone'),
//       gender: anyNamed('gender'),
//     )).thenAnswer((_) async => ErrorApiResult(exception));

//     final result = await registerUsecase(
//       firstName: firstName,
//       lastName: lastName,
//       email: email,
//       password: password,
//       rePassword: rePassword,
//       phone: phone,
//       gender: gender,
//     );

//     expect(result, isA<ErrorApiResult<AuthResponseEntity>>());
//     expect((result as ErrorApiResult).exception.toString(),
//         contains('Registration failed'));
//     verify(mockAuthRepo.postRegister(
//       firstName: firstName,
//       lastName: lastName,
//       email: email,
//       password: password,
//       rePassword: rePassword,
//       phone: phone,
//       gender: gender,
//     ));
//     verifyNoMoreInteractions(mockAuthRepo);
//   });
// }
