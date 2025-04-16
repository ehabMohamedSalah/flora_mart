import 'package:dio/dio.dart';
import 'package:flora_mart/data/datasource_impl/reset_password_data_source_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flora_mart/core/api/api_excuter.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/data/datasource_contract/reset_password_data_sourse_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reset_password_data_source_repo_impl_test.mocks.dart';

@GenerateMocks([ApiManager, CacheHelper])
void main() {
  late MockApiManager mockApiManager;
  late MockCacheHelper mockCacheHelper;
  late ResetPasswordDataSourceRepo resetPasswordRepo;

  setUp(() {
    mockApiManager = MockApiManager();
    mockCacheHelper = MockCacheHelper();
    resetPasswordRepo =
        ResetPasswordDataSourceRepoImpl(mockCacheHelper, mockApiManager);
  });

  group('Reset Password', () {
    test('returns SuccessApiResult(true) when password reset is successful',
        () async {
      const oldPassword = 'old123';
      const newPassword = 'new123';
      const token = 'existing_token';
      const newToken = 'new_token';

      when(mockCacheHelper.getData<String>(Constant.tokenKey))
          .thenAnswer((_) async => token);

      when(mockApiManager.patchRequest(
        endpoint: anyNamed('endpoint'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => Response(
            data: {
              "token": newToken,
              "message": "success",
            },
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      when(mockCacheHelper.setData<String>(Constant.tokenKey, newToken))
          .thenAnswer((_) async => true);

      final result = await resetPasswordRepo.resetPassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );

      expect(result, isA<SuccessApiResult<bool>>());
      expect((result as SuccessApiResult).data, true);
    });

    test('returns SuccessApiResult(false) when response message is not success',
        () async {
      const oldPassword = 'old123';
      const newPassword = 'new123';
      const token = 'existing_token';

      when(mockCacheHelper.getData<String>(Constant.tokenKey))
          .thenAnswer((_) async => token);

      when(mockApiManager.patchRequest(
        endpoint: anyNamed('endpoint'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => Response(
            data: {
              "message": "error",
            },
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      final result = await resetPasswordRepo.resetPassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );

      expect(result, isA<SuccessApiResult<bool>>());
      expect((result as SuccessApiResult).data, false);
    });
    test('returns ErrorApiResult when patch request throws exception',
        () async {
      const oldPassword = 'old123';
      const newPassword = 'new123';
      const token = 'existing_token';

      when(mockCacheHelper.getData<String>(Constant.tokenKey))
          .thenAnswer((_) async => token);

      when(mockApiManager.patchRequest(
        endpoint: anyNamed('endpoint'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Some error',
        response: Response(
          data: {"error": "Invalid password"},
          statusCode: 400,
          requestOptions: RequestOptions(path: ''),
        ),
        type: DioExceptionType.badResponse,
      ));

      final result = await resetPasswordRepo.resetPassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );

      expect(result, isA<ErrorApiResult>());
      expect((result as ErrorApiResult).exception, isA<Exception>());
    });
  });
}
