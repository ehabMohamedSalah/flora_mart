// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flora_mart/data/repo_impl/reset_password_repo_impl.dart';
import 'package:flora_mart/data/datasource_contract/reset_password_data_sourse_repo.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'reset_password_repo_impl_test.mocks.dart';

@GenerateMocks([ResetPasswordDataSourceRepo])
void main() {
  // Provide dummy value for ApiResult<bool>
  provideDummy<ApiResult<bool>>(SuccessApiResult(false));

  late ResetPasswordRepoImpl repoImpl;
  late MockResetPasswordDataSourceRepo mockDataSource;

  setUp(() {
    mockDataSource = MockResetPasswordDataSourceRepo();
    repoImpl = ResetPasswordRepoImpl(mockDataSource);
  });

  group('ResetPasswordRepoImpl Tests', () {
    test('should call data source and return SuccessApiResult', () async {
      // Arrange
      when(mockDataSource.resetPassword(
        oldPassword: 'old123',
        newPassword: 'new123',
      )).thenAnswer((_) async => SuccessApiResult(true));

      // Act
      final result = await repoImpl.resetPassword(
        oldPassword: 'old123',
        newPassword: 'new123',
      );

      // Assert
      expect(result, isA<SuccessApiResult<bool>>());
      expect((result as SuccessApiResult).data, true);
      verify(mockDataSource.resetPassword(
        oldPassword: 'old123',
        newPassword: 'new123',
      )).called(1);
    });

    test('should return ErrorApiResult on failure from data source', () async {
      // Arrange
      final error = Exception("Reset failed");
      when(mockDataSource.resetPassword(
        oldPassword: 'badOld',
        newPassword: 'newPass',
      )).thenAnswer((_) async => ErrorApiResult(error));

      // Act
      final result = await repoImpl.resetPassword(
        oldPassword: 'badOld',
        newPassword: 'newPass',
      );

      // Assert
      expect(result, isA<ErrorApiResult<bool>>());
      expect((result as ErrorApiResult).exception, error);
    });
  });
}
