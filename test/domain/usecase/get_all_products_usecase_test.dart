import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/products/Products.dart';
import 'package:flora_mart/domain/entity/product_entity.dart';
import 'package:flora_mart/domain/repo_contract/get_all_products_repo.dart';
import 'package:flora_mart/domain/usecase/get_all_products_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_all_products_usecase_test.mocks.dart';

@GenerateMocks([GetAllProductsRepo])
void main() {

  provideDummy<ApiResult<List<Products>>>(SuccessApiResult([]));
  provideDummy<ApiResult<List<Products>>>(ErrorApiResult(Exception("Dummy error")));

  late GetAllProductsUsecase getAllProductsUsecase;
  late MockGetAllProductsRepo mockGetAllProductsRepo;

  setUp(() {
    mockGetAllProductsRepo = MockGetAllProductsRepo();
    getAllProductsUsecase = GetAllProductsUsecase(mockGetAllProductsRepo);
  });

  group('GetAllProductsUsecase Tests', () {
    const String testCategoryId = 'category123';

    test('should return SuccessApiResult when products are retrieved successfully', () async {
      // Arrange
      final List<Products> productList = [
        Products(
            id: "673e1cd711599201718280fb",
            title: "Wdding Flower",
            slug: "wdding-flower",
            description: "This is a Pack of White Widding Flowers",
            imgCover: "https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png",
            images: [
              "https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png",
              "https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png",
              "https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"
            ],
            price: 400,
            priceAfterDiscount: 100,
            quantity: 3985,
            category: "673c46fd1159920171827c85",
            occasion: "673b34c21159920171827ae0",
            createdAt: "2024-11-20T17:31:03.303Z",
            updatedAt: "2025-04-01T18:42:35.619Z",
            discount: 50,
            sold: 677,
            rateAvg: 3.5,
            rateCount: 30),
        Products(
            id: "673e2bd91159920171828139",
            title: "Red Wdding Flower",
            slug: "red-wdding-flower",
            description: "This is a Pack of Red Widding Flowers",
            imgCover: "https://flower.elevateegy.com/uploads/5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png",
            images: [
              "https://flower.elevateegy.com/uploads/ba028e59-410f-43ac-aed5-f4f97c102b98-image_four.png",
              "https://flower.elevateegy.com/uploads/f89bc954-eb0d-4efb-928f-6717f77b69ed-image_one.png",
              "https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png",
              "https://flower.elevateegy.com/uploads/c0992ec6-d3c0-4a54-b7ec-4cf000138367-image_two.png"
            ],
            price: 250,
            priceAfterDiscount: 150,
            quantity: 691,
            category: "673c46fd1159920171827c85",
            occasion: "673b34c21159920171827ae0",
            createdAt: "2024-11-20T18:35:05.594Z",
            updatedAt: "2025-04-01T18:42:35.619Z",
            discount: 50,
            sold: 309,
            rateAvg: 5,
            rateCount: 0),
      ];
      when(mockGetAllProductsRepo.getAllProducts(testCategoryId))
          .thenAnswer((_) async => SuccessApiResult(productList));

      // Act
      final result = await getAllProductsUsecase.execute(testCategoryId);

      // Assert
      expect(result, isA<SuccessApiResult<List<ProductEntity>>>());
      expect((result as SuccessApiResult).data, isNotEmpty);
      //expect(result.data!.length, 2);
      verify(mockGetAllProductsRepo.getAllProducts(testCategoryId)).called(1);
      verifyNoMoreInteractions(mockGetAllProductsRepo);
    });

    test('should return ErrorApiResult when an error occurs while retrieving products', () async {
      // Arrange
      final error = Exception('Failed to load products');
      when(mockGetAllProductsRepo.getAllProducts(testCategoryId))
          .thenAnswer((_) async => ErrorApiResult(error));

      // Act
      final result = await getAllProductsUsecase.execute(testCategoryId);

      // Assert
      expect(result, isA<ErrorApiResult<List<ProductEntity>>>());
      expect((result as ErrorApiResult).exception.toString(), contains('Failed to load products'));
      verify(mockGetAllProductsRepo.getAllProducts(testCategoryId)).called(1);
      verifyNoMoreInteractions(mockGetAllProductsRepo);
    });
  });
}
