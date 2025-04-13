import 'package:dio/dio.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/data/datasource_impl/best_seller_datasource_impl.dart';
import 'package:flora_mart/data/model/BestSellerModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'Login_Data_Source_Repo_Impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  group("getBestSellers in DataSource Impl", () {
    late BestSellerDataSourceImpl dataSource;
    late ApiManager apiManager;

    setUp(() {
      apiManager = MockApiManager();
      dataSource = BestSellerDataSourceImpl(apiManager);
    });

    test(
      "when calling getBestSellers, it should return SuccessApiResult if API call succeeds",
      () async {
        // Arrange
        final mockResponse = Response(
          requestOptions: RequestOptions(path: ''),
          data: {
            'data': {
              'bestSeller': [
                {
                  'id': '1',
                  'title': 'Test Flower',
                  'slug': 'test-flower',
                  'description': 'Test Description',
                  'imgCover': 'test-image.jpg',
                  'images': ['image1.jpg'],
                  'price': 100.0,
                  'priceAfterDiscount': 90.0,
                  'quantity': 10,
                  'category': 'Test Category',
                  'occasion': 'Test Occasion',
                  'createdAt': DateTime.now().toIso8601String(),
                  'updatedAt': DateTime.now().toIso8601String(),
                  'discount': 10,
                  'sold': 5,
                  'rateAvg': 4.5,
                  'rateCount': 10,
                }
              ]
            }
          },
        );

        when(apiManager.getRequest(
          endpoint: EndPoint.bestSellerEndpoint,
        )).thenAnswer((_) async => mockResponse);

        // Act
        final result = await dataSource.getBestSellers();

        // Assert
        expect(result, isA<SuccessApiResult<List<BestSellerModel>>>());
        final successResult = result as SuccessApiResult<List<BestSellerModel>>;
        expect(successResult.data?.length, equals(1));
        expect(successResult.data?.first.id, equals('1'));
        verify(apiManager.getRequest(
          endpoint: EndPoint.bestSellerEndpoint,
        )).called(1);
      },
    );

    test(
      "when calling getBestSellers, it should return ErrorApiResult if API call fails",
      () async {
        // Arrange
        when(apiManager.getRequest(
          endpoint: EndPoint.bestSellerEndpoint,
        )).thenThrow(DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: {'message': 'Network Error', 'status': 'error'},
          ),
          type: DioExceptionType.badResponse,
        ));

        // Act
        final result = await dataSource.getBestSellers();

        // Assert
        expect(result, isA<ErrorApiResult<List<BestSellerModel>>>());
        verify(apiManager.getRequest(
          endpoint: EndPoint.bestSellerEndpoint,
        )).called(1);
      },
    );

    test(
      "when API returns empty bestSeller list, it should return empty list in SuccessApiResult",
      () async {
        // Arrange
        final mockResponse = Response(
          requestOptions: RequestOptions(path: ''),
          data: {'bestSeller': []},
        );

        when(apiManager.getRequest(
          endpoint: EndPoint.bestSellerEndpoint,
        )).thenAnswer((_) async => mockResponse);

        // Act
        final result = await dataSource.getBestSellers();

        // Assert
        expect(result, isA<SuccessApiResult<List<BestSellerModel>>>());
        final successResult = result as SuccessApiResult<List<BestSellerModel>>;
        expect(successResult.data?.isEmpty, isTrue);
        verify(apiManager.getRequest(
          endpoint: EndPoint.bestSellerEndpoint,
        )).called(1);
      },
    );
  });
}
