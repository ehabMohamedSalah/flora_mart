import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/best_seller_datasource.dart';
import 'package:flora_mart/data/model/BestSellerModel.dart';
import 'package:flora_mart/data/repo_impl/best_seller_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'best_seller_repo_impl_test.mocks.dart';

@GenerateMocks([BestSellerDataSource])
void main() {
  group("getBestSellers in Repository Impl", () {
    late BestSellerRepoImpl repository;
    late BestSellerDataSource dataSource;

    setUp(() {
      dataSource = MockBestSellerDataSource();
      repository = BestSellerRepoImpl(dataSource);
      
      // Provide dummy value for ApiResult
      provideDummy<ApiResult<List<BestSellerModel>>>(
        SuccessApiResult<List<BestSellerModel>>([]),
      );
    });

    test(
      "when calling getBestSellers, it should return SuccessApiResult if DataSource.getBestSellers() succeeds",
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
        when(dataSource.getBestSellers())
            .thenAnswer((_) async => SuccessApiResult<List<BestSellerModel>>(testBestSellers));

        // Act
        final result = await repository.getBestSellers();

        // Assert
        expect(result, isA<SuccessApiResult<List<BestSellerModel>>>());
        expect((result as SuccessApiResult<List<BestSellerModel>>).data, equals(testBestSellers));
        verify(dataSource.getBestSellers()).called(1);
      },
    );

    test(
      "when calling getBestSellers, it should return ErrorApiResult if DataSource.getBestSellers() fails",
      () async {
        // Arrange
        when(dataSource.getBestSellers())
            .thenAnswer((_) async => ErrorApiResult<List<BestSellerModel>>(Exception("Error")));

        // Act
        final result = await repository.getBestSellers();

        // Assert
        expect(result, isA<ErrorApiResult<List<BestSellerModel>>>());
        verify(dataSource.getBestSellers()).called(1);
      },
    );
  });
}
