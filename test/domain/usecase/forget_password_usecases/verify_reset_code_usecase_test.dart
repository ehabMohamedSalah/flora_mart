import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/repo_contract/forget_password_repo_contract/verify_reset_code_repo.dart';
import 'package:flora_mart/domain/usecase/forget_password_usecases/verify_reset_code_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'verify_reset_code_usecase_test.mocks.dart';

@GenerateMocks([VerifyresetcodeRepo])
void main() {

  provideDummy<ApiResult<bool>>(SuccessApiResult(false));
  provideDummy<ApiResult<bool>>(ErrorApiResult(Exception("Dummy error")));

  late VerifyresetcodeUseCase verifyResetCodeUseCase;
  late MockVerifyresetcodeRepo mockVerifyresetcodeRepo;

  setUp(() {
    mockVerifyresetcodeRepo = MockVerifyresetcodeRepo();
    verifyResetCodeUseCase = VerifyresetcodeUseCase(repo: mockVerifyresetcodeRepo);
  });

  group('VerifyResetCodeUseCase Tests', () {
    const String testCode = '123456';

    test('should return SuccessApiResult when reset code is verified successfully', () async {
      // Arrange
      when(mockVerifyresetcodeRepo.verifyResetCode(code: testCode))
          .thenAnswer((_) async => SuccessApiResult(true));

      // Act
      final result = await verifyResetCodeUseCase.check(code: testCode);

      // Assert
      expect(result, isA<SuccessApiResult<bool>>());
      expect((result as SuccessApiResult).data, true);
      verify(mockVerifyresetcodeRepo.verifyResetCode(code: testCode)).called(1);
      verifyNoMoreInteractions(mockVerifyresetcodeRepo);
    });

    test('should return ErrorApiResult when reset code verification fails', () async {
      // Arrange
      final error = Exception('Reset code verification failed');
      when(mockVerifyresetcodeRepo.verifyResetCode(code: testCode))
          .thenAnswer((_) async => ErrorApiResult(error));

      // Act
      final result = await verifyResetCodeUseCase.check(code: testCode);

      // Assert
      expect(result, isA<ErrorApiResult<bool>>());
      expect((result as ErrorApiResult).exception.toString(), contains('Reset code verification failed'));
      verify(mockVerifyresetcodeRepo.verifyResetCode(code: testCode)).called(1);
      verifyNoMoreInteractions(mockVerifyresetcodeRepo);
    });
  });
}
