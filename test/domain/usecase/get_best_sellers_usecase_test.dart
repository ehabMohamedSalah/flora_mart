import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/BestSellerModel.dart';
import 'package:flora_mart/domain/repo_contract/best_seller_repo.dart';
import 'package:flora_mart/domain/usecase/get_best_sellers_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_best_sellers_usecase_test.mocks.dart';

@GenerateMocks([BestSellerRepo])
void main() {
  group('GetBestSellersUseCase', () {
    late GetBestSellersUseCase useCase;
    late BestSellerRepo mockRepo;

    setUp(() {
      mockRepo = MockBestSellerRepo();
      useCase = GetBestSellersUseCase(mockRepo);
      
      // Provide dummy value for ApiResult
      provideDummy<ApiResult<List<BestSellerModel>>>(
        SuccessApiResult<List<BestSellerModel>>([]),
      );
    });

    test(
      'should return SuccessApiResult when repository call succeeds',
      () async {
        // Arrange
        final testBestSellers = [
          BestSellerModel(
            id: '1',
            title: 'Test Flower',
            slug: 'test-flower',
            description: 'Test Description',
            imgCover: 'test-image.jpg',
            images: ['image1.jpg'],
            price: 100.0,
            priceAfterDiscount: 90.0,
            quantity: 10,
            category: 'Test Category',
            occasion: 'Test Occasion',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            discount: 10,
            sold: 5,
            rateAvg: 4.5,
            rateCount: 10,
          )
        ];

        when(mockRepo.getBestSellers())
            .thenAnswer((_) async => SuccessApiResult(testBestSellers));

        // Act
        final result = await useCase.invoke();

        // Assert
        expect(result, isA<SuccessApiResult<List<BestSellerModel>>>());
        final successResult = result as SuccessApiResult<List<BestSellerModel>>;
        expect(successResult.data, equals(testBestSellers));
        verify(mockRepo.getBestSellers()).called(1);
      },
    );

    test(
      'should return ErrorApiResult when repository call fails',
      () async {
        // Arrange
        final exception = Exception('Error fetching best sellers');
        when(mockRepo.getBestSellers())
            .thenAnswer((_) async => ErrorApiResult(exception));

        // Act
        final result = await useCase.invoke();

        // Assert
        expect(result, isA<ErrorApiResult<List<BestSellerModel>>>());
        final errorResult = result as ErrorApiResult<List<BestSellerModel>>;
        expect(errorResult.exception, equals(exception));
        verify(mockRepo.getBestSellers()).called(1);
      },
    );
  });
}
