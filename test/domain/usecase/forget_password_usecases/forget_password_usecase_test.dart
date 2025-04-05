import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/repo_contract/forget_password_repo_contract/forget_password_repo.dart';
import 'package:flora_mart/domain/usecase/forget_password_usecases/forget_password_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'forget_password_usecase_test.mocks.dart';

@GenerateMocks([ForgetpasswordRepo])
void main() {

  provideDummy<ApiResult<bool>>(SuccessApiResult(false));
  provideDummy<ApiResult<bool>>(ErrorApiResult(Exception("Dummy error")));

  late ForgetPasswordUseCase forgetPasswordUseCase;
  late MockForgetpasswordRepo mockForgetpasswordRepo;

  setUp(() {
    mockForgetpasswordRepo = MockForgetpasswordRepo();
    forgetPasswordUseCase = ForgetPasswordUseCase(forgetPassword: mockForgetpasswordRepo);
  });

  group('ForgetPasswordUseCase Tests', () {
    const String testEmail = 'ayaallahemara@gmail.com';

    test('should return SuccessApiResult when email verification is sent successfully', () async {
      // Arrange
      when(mockForgetpasswordRepo.SendEmailVerification(email: testEmail))
          .thenAnswer((_) async => SuccessApiResult(true));

      // Act
      final result = await forgetPasswordUseCase.invoke(email: testEmail);

      // Assert
      expect(result, isA<SuccessApiResult<bool>>());
      expect((result as SuccessApiResult).data, true);
      verify(mockForgetpasswordRepo.SendEmailVerification(email: testEmail)).called(1);
      verifyNoMoreInteractions(mockForgetpasswordRepo);
    });

    test('should return ErrorApiResult when email verification fails', () async {
      // Arrange
      final error = Exception('Email verification failed');
      when(mockForgetpasswordRepo.SendEmailVerification(email: testEmail))
          .thenAnswer((_) async => ErrorApiResult(error));

      // Act
      final result = await forgetPasswordUseCase.invoke(email: testEmail);

      // Assert
      expect(result, isA<ErrorApiResult<bool>>());
      expect((result as ErrorApiResult).exception.toString(), contains('Email verification failed'));
      verify(mockForgetpasswordRepo.SendEmailVerification(email: testEmail)).called(1);
      verifyNoMoreInteractions(mockForgetpasswordRepo);
    });
  });
}