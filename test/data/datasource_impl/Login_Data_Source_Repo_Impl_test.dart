import 'package:dio/dio.dart';
import 'package:flora_mart/data/datasource_impl/Login_Data_Source_Repo_Impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_contract/Login_Data_Source_Repo.dart';
import 'package:flora_mart/data/model/UserModel.dart';

import 'Login_Data_Source_Repo_Impl_test.mocks.dart';

@GenerateMocks([ApiManager, CacheHelper])
void main() {
  late LoginDatasourceImpl loginDatasource;
  late MockApiManager mockApiManager;
  late MockCacheHelper mockCacheHelper;

  setUp(() {
    mockApiManager = MockApiManager();
    mockCacheHelper = MockCacheHelper();
    loginDatasource = LoginDatasourceImpl(mockApiManager, mockCacheHelper);
  });

  group('login', () {
    const email = 'test@example.com';
    const password = 'password123';
    const token = 'fake_token';
    const rememberMe = true;

    final mockResponse = {
      'token': token,
      'name': 'Test User',
      'email': email,
    };


    test('should return UserModel on successful login', () async {

      when(mockApiManager.postRequest(
        endpoint: EndPoint.signInEndpoint,
        body: anyNamed('body'),
      )).thenAnswer((_) async => Response(
        data: mockResponse,
        statusCode: 200,
        requestOptions: RequestOptions(path: EndPoint.signInEndpoint),
      ));


      when(mockCacheHelper.setData<String>(Constant.tokenKey, token))
          .thenAnswer((_) async => true);
      when(mockCacheHelper.setData<bool>(Constant.isRememberMe, rememberMe))
          .thenAnswer((_) async => true);

      final result = await loginDatasource.login(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );

      expect(result, isA<SuccessApiResult<UserModel>>());
      expect((result as SuccessApiResult<UserModel>).data?.token, equals(token));
    });

    test('should return error on failed login', () async {
      when(mockApiManager.postRequest(
        endpoint: EndPoint.signInEndpoint,
        body: anyNamed('body'),
      )).thenThrow(Exception('Login failed'));


      final result = await loginDatasource.login(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );

      expect(result, isA<ErrorApiResult<UserModel>>());
      expect((result as ErrorApiResult<UserModel>).exception.toString(), contains('Login failed'));
    });

  });

}