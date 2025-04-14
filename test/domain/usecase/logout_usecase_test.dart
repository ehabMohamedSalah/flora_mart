import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/repo_contract/logout_repo_contract.dart';
import 'package:flora_mart/domain/usecase/logout_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'logout_usecase_test.mocks.dart';

@GenerateMocks([LogoutRepoContract])
void main() {
  late LogoutUsecase logoutUsecase;
  late MockLogoutRepoContract mockLogoutRepoContract;

  setUp(() {
    mockLogoutRepoContract = MockLogoutRepoContract();
    logoutUsecase = LogoutUsecase(logoutRepoContract: mockLogoutRepoContract);
  });

  group('LogoutUsecase Tests', () {
    const String testToken = 'dummy_token';

    test('should return SuccessApiResult when logout is successful', () async {
      // Arrange
      when(mockLogoutRepoContract.logout())
          .thenAnswer((_) async => SuccessApiResult(true));

      // Act
      final result = await logoutUsecase.invoke();

      // Assert
      expect(result, isA<SuccessApiResult<bool>>());
      expect((result as SuccessApiResult).data, true);
      verify(mockLogoutRepoContract.logout()).called(1);
      verifyNoMoreInteractions(mockLogoutRepoContract);
    });

    test('should return ErrorApiResult when logout fails', () async {
      // Arrange
      final error = Exception('Logout failed');
      when(mockLogoutRepoContract.logout())
          .thenAnswer((_) async => ErrorApiResult(error));

      // Act
      final result = await logoutUsecase.invoke();

      // Assert
      expect(result, isA<ErrorApiResult<bool>>());
      expect((result as ErrorApiResult).exception.toString(), contains('Logout failed'));
      verify(mockLogoutRepoContract.logout()).called(1);
      verifyNoMoreInteractions(mockLogoutRepoContract);
    });
  });
}
