// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/auth/user_entity.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';
import 'package:flora_mart/domain/repo_contract/profile_repo.dart';
import 'package:flora_mart/domain/usecase/get_profile_details_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'get_profile_details_usecase_test.mocks.dart';

// Generate mock class for ProfileRepo
@GenerateMocks([ProfileRepo])
void main() {
  provideDummy<ApiResult<GetLoggedUserDataEntity>>(
      SuccessApiResult<GetLoggedUserDataEntity>(null));
  late GetProfileDetailsUsecase getProfileDetailsUsecase;
  late MockProfileRepo mockProfileRepo;

  setUp(() {
    mockProfileRepo = MockProfileRepo();
    getProfileDetailsUsecase = GetProfileDetailsUsecase(mockProfileRepo);
  });

  final userDataEntity = GetLoggedUserDataEntity();

  test('should return SuccessApiResult when profile is updated successfully',
      () async {
    // Arrange
    when(mockProfileRepo.getLoggedUserData())
        .thenAnswer((_) async => SuccessApiResult(userDataEntity));

    // Act
    final result = await getProfileDetailsUsecase.call();

    // Assert
    expect(result, isA<SuccessApiResult<GetLoggedUserDataEntity>>());
    verify(mockProfileRepo.getLoggedUserData()).called(1);
  });

  test('should return ErrorApiResult when profile update fails', () async {
    // Arrange
    final exception = Exception("Failed to update profile");
    when(mockProfileRepo.getLoggedUserData())
        .thenAnswer((_) async => ErrorApiResult(exception));

    // Act
    final result = await getProfileDetailsUsecase.call();

    // Assert
    expect(result, isA<ErrorApiResult<GetLoggedUserDataEntity>>());
    expect((result as ErrorApiResult).exception, equals(exception));
    verify(mockProfileRepo.getLoggedUserData()).called(1);
  });

  test('should throw an exception if API call fails with an exception',
      () async {
    // Arrange
    when(mockProfileRepo.getLoggedUserData())
        .thenThrow(Exception("API call failed"));

    // Act & Assert
    expect(
      () async => await getProfileDetailsUsecase.call(),
      throwsA(isA<Exception>()),
    );
  });

  test('should throw an exception when name or email is empty', () async {
    // Arrange
    when(mockProfileRepo.getLoggedUserData())
        .thenThrow(Exception("name or email cannot be empty"));

    // Act & Assert
    expect(
      () async => await getProfileDetailsUsecase.call(),
      throwsA(isA<Exception>()),
    );
  });
}
