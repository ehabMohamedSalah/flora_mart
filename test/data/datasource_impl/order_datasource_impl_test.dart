import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_impl/order_datasource_impl.dart';
import 'package:flora_mart/data/model/order_response/OrderResponse.dart';

import 'Login_Data_Source_Repo_Impl_test.mocks.dart';

@GenerateMocks([ApiManager, CacheHelper])
void main() {
  group('OrderDataSourceImpl - getOrder', () {
    late MockApiManager apiManager;
    late MockCacheHelper cacheHelper;
    late OrderDataSourceImpl dataSource;

    setUp(() {
      apiManager = MockApiManager();
      cacheHelper = MockCacheHelper();
      dataSource = OrderDataSourceImpl(apiManager, cacheHelper);
    });

    test('returns SuccessApiResult when API succeeds', () async {
      // Arrange
      when(cacheHelper.getData(Constant.tokenKey)).thenAnswer(
              (_) async => "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjc4YTc4M2QzYzM3OTc0OTI3NDdjOGU2Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzcxMjc5OTd9.ey-sIWm8Z9QpiUNEfK5U-Ma5lzB2NxI7-DbKZfH1wfM"
      );
      final mockOrderResponseData = {
        "message": "success",
        "metadata": {
          "currentPage": 1,
          "totalPages": 1,
          "limit": 40,
          "totalItems": 12
        },
        "orders": [
          {
            "_id": "678a9bb63745562ff48ce07b",
            "user": "678a783d3c3797492747c8e6",

          }
        ]
      };

      final mockResponse = Response(
        requestOptions: RequestOptions(path: EndPoint.orderEndpoint),
        data: mockOrderResponseData,
      );

      final headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjc4YTc4M2QzYzM3OTc0OTI3NDdjOGU2Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzcxMjc5OTd9.ey-sIWm8Z9QpiUNEfK5U-Ma5lzB2NxI7-DbKZfH1wfM"
      };

      when(apiManager.getRequest(
        endpoint: EndPoint.orderEndpoint,
        headers: headers,
      )).thenAnswer((_) async => mockResponse);

      // Act
      final result = await dataSource.getOrder();

      // Assert
      expect(result, isA<SuccessApiResult<OrderResponse>>());
      final success = result as SuccessApiResult<OrderResponse>;
      expect(success.data?.orders?.first.id, equals('678a9bb63745562ff48ce07b'));

      verify(apiManager.getRequest(
        endpoint: EndPoint.orderEndpoint,
        headers: headers,
      )).called(1);
    });
  });
}
