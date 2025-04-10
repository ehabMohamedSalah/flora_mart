
import 'package:bloc_test/bloc_test.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/products/Products.dart';
import 'package:flora_mart/domain/usecase/get_all_products_usecase.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_cubit.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_intent.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_cubit_test.mocks.dart';

@GenerateMocks([GetAllProductsUsecase])
void main() {
  group('ProductCubit', () {
    late GetAllProductsUsecase getAllProductsUsecase;
    late ProductCubit productCubit;

    const String testTypeId = 'category_123';
    const String testType = 'category';

    setUp(() {
      getAllProductsUsecase = MockGetAllProductsUsecase();
      productCubit = ProductCubit(getAllProductsUsecase: getAllProductsUsecase);

      // Provide a dummy value for ApiResult<List<ProductEntity>> using provideDummy
      provideDummy<ApiResult<List<Products>>>(
          SuccessApiResult(
              [
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
                    rateCount: 30
                ),
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
                    rateCount: 0
                ),
              ]
          )
      );
    });

    blocTest<ProductCubit, ProductState>(
      'emits [ProductLoadingState, ProductLoadedState] when getProducts is successful',
      build: () {
        // Mock the result of the use case
        when(getAllProductsUsecase.execute(testTypeId,testType))
            .thenAnswer((_) async => SuccessApiResult(
            [
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
                  rateCount: 30
              ),
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
                  rateCount: 0
              ),
            ]
        ));
        return productCubit;
      },
      act: (cubit) => cubit.doIntent(GetProductsIntent(testTypeId,testType)),
      expect: () => [
        isA<ProductLoadingState>(),
        isA<ProductLoadedState>(),
      ],
    );

    blocTest<ProductCubit, ProductState>(
      'emits [ProductLoadingState, ProductErrorState] when getProducts fails',
      build: () {
        // Mock the error result of the use case
        when(getAllProductsUsecase.execute(testTypeId,testType))
            .thenAnswer((_) async => ErrorApiResult(Exception('Failed to load products')));
        return productCubit;
      },
      act: (cubit) => cubit.doIntent(GetProductsIntent( testTypeId,testType)),
      expect: () => [
        isA<ProductLoadingState>(),
        isA<ProductErrorState>(),
      ],
    );
  });
}
