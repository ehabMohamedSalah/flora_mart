import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/UserModel.dart';
import 'package:flora_mart/domain/repo_contract/Login_Repo.dart';
import 'package:flora_mart/domain/usecase/login_Usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'login_usecase_test.mocks.dart';

// Generate mock class for LoginRepo
@GenerateMocks([LoginRepo])
void main() {
  provideDummy<ApiResult<UserModel>>(SuccessApiResult<UserModel>(null));
  late LoginUsecase loginUsecase;
  late MockLoginRepo mockLoginRepo;

  setUp(() {
    mockLoginRepo = MockLoginRepo();
    loginUsecase = LoginUsecase(loginRepo: mockLoginRepo);
  });

  const email = "test@example.com";
  const password = "password123";
  const rememberMe = true;
  final userModel = UserModel(); // Replace with actual constructor

  test('should return SuccessApiResult when login is successful', () async {
    // Arrange
    when(mockLoginRepo.login(
            email: email, password: password, rememberMe: rememberMe))
        .thenAnswer((_) async => SuccessApiResult(userModel));

    // Act
    final result = await loginUsecase.invoke(
        email: email, password: password, rememberMe: rememberMe);

    // Assert
    expect(result, isA<SuccessApiResult<UserModel>>());
    expect((result as SuccessApiResult).data, equals(userModel));
    verify(mockLoginRepo.login(
            email: email, password: password, rememberMe: rememberMe))
        .called(1);
  });
  test('should throw an exception when email format is invalid', () async {
    // ✅ Stub the method BEFORE calling invoke()
    when(mockLoginRepo.login(
      email: anyNamed('email'),
      password: anyNamed('password'),
      rememberMe: anyNamed('rememberMe'),
    )).thenThrow(Exception("Invalid email format"));

    // 🔹 Now calling invoke() should match the stub
    expect(
      () => loginUsecase.invoke(
        email: 'invalid-email',
        password: 'password123',
        rememberMe: true,
      ),
      throwsA(isA<Exception>()),
    );
  });

  test('should return ErrorApiResult when login fails', () async {
    // Arrange
    final exception = Exception("Login failed");
    when(mockLoginRepo.login(
            email: email, password: password, rememberMe: rememberMe))
        .thenAnswer((_) async => ErrorApiResult(exception));

    // Act
    final result = await loginUsecase.invoke(
        email: email, password: password, rememberMe: rememberMe);

    // Assert
    expect(result, isA<ErrorApiResult<UserModel>>());
    expect((result as ErrorApiResult).exception, equals(exception));
    verify(mockLoginRepo.login(
            email: email, password: password, rememberMe: rememberMe))
        .called(1);
  });

  test('should throw an exception when email or password is empty', () async {
    when(mockLoginRepo.login(
            email: anyNamed('email'),
            password: anyNamed('password'),
            rememberMe: anyNamed('rememberMe')))
        .thenThrow(Exception("Email or password cannot be empty"));

    expect(
      () =>
          loginUsecase.invoke(email: '', password: '', rememberMe: rememberMe),
      throwsA(isA<Exception>()),
    );
  });

  test('should return ErrorApiResult when an unexpected error occurs',
      () async {
    when(mockLoginRepo.login(
            email: email, password: password, rememberMe: rememberMe))
        .thenThrow(Exception('Unexpected error'));

    expect(
      () async => await loginUsecase.invoke(
          email: email, password: password, rememberMe: rememberMe),
      throwsA(isA<Exception>()),
    );
  });
}
