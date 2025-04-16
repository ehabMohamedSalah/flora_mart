// ignore_for_file: prefer_const_constructors

import 'package:flora_mart/domain/usecase/reset_password_Usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flora_mart/domain/repo_contract/reset_password_repo.dart';
import 'package:flora_mart/core/api/api_result.dart';

import 'reset_password_usecase_test.mocks.dart';

@GenerateMocks([ResetPasswordRepo])
void main() {
  provideDummy<ApiResult<bool>>(SuccessApiResult(false));
  provideDummy<ApiResult<bool>>(ErrorApiResult(Exception("Dummy error")));
  late ResetPasswordUsecase resetPasswordUsecase;
  late MockResetPasswordRepo mockResetPasswordRepo;

  setUp(() {
    mockResetPasswordRepo = MockResetPasswordRepo();
    resetPasswordUsecase =
        ResetPasswordUsecase(resetPasswordRepo: mockResetPasswordRepo);
  });

  group('ResetPasswordUsecase Tests', () {
    test('should return SuccessApiResult when password is reset successfully',
        () async {
      // Arrange
      when(mockResetPasswordRepo.resetPassword(
        oldPassword: 'old123',
        newPassword: 'new123',
      )).thenAnswer((_) async => SuccessApiResult(true));

      // Act
      final result = await resetPasswordUsecase.invoke(
        oldPassword: 'old123',
        newPassword: 'new123',
      );

      // Assert
      expect(result, isA<SuccessApiResult<bool>>());
      expect((result as SuccessApiResult).data, true);
      verify(mockResetPasswordRepo.resetPassword(
        oldPassword: 'old123',
        newPassword: 'new123',
      )).called(1);
    });

    test('should return ErrorApiResult on failure', () async {
      // Arrange
      final error = Exception("Reset failed");
      when(mockResetPasswordRepo.resetPassword(
        oldPassword: 'wrongOld',
        newPassword: 'newPass',
      )).thenAnswer((_) async => ErrorApiResult(error));

      // Act
      final result = await resetPasswordUsecase.invoke(
        oldPassword: 'wrongOld',
        newPassword: 'newPass',
      );

      // Assert
      expect(result, isA<ErrorApiResult<bool>>());
      expect((result as ErrorApiResult).exception, error);
    });
  });
}
