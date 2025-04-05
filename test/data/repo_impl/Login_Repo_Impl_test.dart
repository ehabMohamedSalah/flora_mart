import 'package:flora_mart/data/repo_impl/Login_Repo_Impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/UserModel.dart';
import 'package:flora_mart/data/datasource_contract/Login_Data_Source_Repo.dart';

import 'Login_Repo_Impl_test.mocks.dart';


@GenerateMocks([LoginDataSourceRepo])
void main() {
  provideDummy<ApiResult<UserModel>>(SuccessApiResult<UserModel>(null));
  late SigninRepoImpl signinRepo;
  late MockLoginDataSourceRepo mockLoginDataSourceRepo;

  setUp(() {
    mockLoginDataSourceRepo = MockLoginDataSourceRepo();
    signinRepo = SigninRepoImpl(mockLoginDataSourceRepo);
  });

  const email = "test@example.com";
  const password = "password123";
  const rememberMe = true;
  final userModel = UserModel(); // Replace with actual constructor

  test('should return SuccessApiResult when login is successful', () async {
    // Arrange
    when(mockLoginDataSourceRepo.login(
      email: email,
      password: password,
      rememberMe: rememberMe,
    )).thenAnswer((_) async => SuccessApiResult(userModel));

    // Act
    final result = await signinRepo.login(
        email: email, password: password, rememberMe: rememberMe);

    // Assert
    expect(result, isA<SuccessApiResult<UserModel>>());
    expect((result as SuccessApiResult).data, equals(userModel));
    verify(mockLoginDataSourceRepo.login(
      email: email,
      password: password,
      rememberMe: rememberMe,
    )).called(1);
  });

  test('should return ErrorApiResult when login fails', () async {
    // Arrange
    final exception = Exception("Login failed");
    when(mockLoginDataSourceRepo.login(
      email: email,
      password: password,
      rememberMe: rememberMe,
    )).thenAnswer((_) async => ErrorApiResult(exception));

    // Act
    final result = await signinRepo.login(
        email: email, password: password, rememberMe: rememberMe);

    // Assert
    expect(result, isA<ErrorApiResult<UserModel>>());
    expect((result as ErrorApiResult).exception, equals(exception));
    verify(mockLoginDataSourceRepo.login(
      email: email,
      password: password,
      rememberMe: rememberMe,
    )).called(1);
  });

  test('should throw an exception when email or password is empty', () async {
    when(mockLoginDataSourceRepo.login(
      email: anyNamed('email'),
      password: anyNamed('password'),
      rememberMe: anyNamed('rememberMe'),
    )).thenThrow(Exception("Email or password cannot be empty"));

    expect(
          () => signinRepo.login(email: '', password: '', rememberMe: rememberMe),
      throwsA(isA<Exception>()),
    );
  });
}
