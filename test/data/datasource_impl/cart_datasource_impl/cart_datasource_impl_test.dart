import 'package:dio/dio.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_impl/cart_datasource_impl/cart_datasource_impl.dart';
import 'package:flora_mart/data/model/cart/Cart.dart';
import 'package:flora_mart/data/model/cart/CartItems.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager, CacheHelper])
void main() {
  late CartDatasourceImpl datasource;
  late MockApiManager mockApiManager;
  late MockCacheHelper mockCacheHelper;

  const token = 'mock_token';
  const productId = '1';
  const quantity = 2;
  const message = 'Success';

  final cartResponse = CartResponse(
    message: message,
    cart: Cart(
      cartItems: [
        CartItems(
          // product: Product(
          //   id: productId,
          //   category: '',
          //   occasion: '',
          //   createdAt: '',
          //   description: '',
          //   discount: 0,
          //   images: [],
          //   imgCover: '',
          //   price: 0,
          //   priceAfterDiscount: 0,
          //   quantity: 0,
          //   rateAvg: 0,
          //   rateCount: 0,
          //   sold: 0,
          //   title: '',
          //   updatedAt: '',
          //   slug: '',
          //   v: 0,
          // ).toProducts(),
          quantity: quantity,
        ),
      ],
    ),
  );

  setUp(() {
    mockApiManager = MockApiManager();
    mockCacheHelper = MockCacheHelper();

    datasource = CartDatasourceImpl(
      apiManager: mockApiManager,
      cacheHelper: mockCacheHelper,
    );
  });

  group('CartDatasourceImpl Tests', () {
    test('addToCart returns CartResponse on success', () async {
      when(mockCacheHelper.getData<String>(Constant.tokenKey))
          .thenAnswer((_) async => token);
      when(mockApiManager.postRequest(
        endpoint: anyNamed('endpoint'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer(
        (_) async => Response(
          data: cartResponse.toJson(),
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await datasource.addToCart(
        productId: productId,
        quantity: quantity,
      );
      verify(datasource.addToCart(productId: productId, quantity: quantity))
          .called(1);

      expect(result, isA<SuccessApiResult<dynamic>>());
      expect(
          ((result as SuccessApiResult<dynamic>).data as CartResponse).message,
          equals(message));
    });

    test('getCartItems returns CartResponse on success', () async {
      // var apiResult = SuccessApiResult<CartResponse>(cartResponse);
      when(mockCacheHelper.getData<String>(Constant.tokenKey))
          .thenAnswer((_) async => token);
      when(mockApiManager.getRequest(
        endpoint: anyNamed('endpoint'),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => Response(
          data: cartResponse.toJson(),
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await datasource.getCartItems();

      expect(result, isA<SuccessApiResult<CartResponse>>());
      expect((result as SuccessApiResult<CartResponse>).data?.message,
          equals(message));
    });

    test('removeFromCart returns CartResponse on success', () async {
      when(mockCacheHelper.getData<String>(Constant.tokenKey))
          .thenAnswer((_) async => token);
      when(mockApiManager.delete(
        endpoint: anyNamed('endpoint'),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => Response(
          data: cartResponse.toJson(),
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await datasource.removeFromCart(productId: productId);

      expect(result, isA<SuccessApiResult<CartResponse>>());
      expect((result as SuccessApiResult<CartResponse>).data?.message,
          equals(message));
    });

    test('updateProductQuantity returns CartResponse on success', () async {
      when(mockCacheHelper.getData<String>(Constant.tokenKey))
          .thenAnswer((_) async => token);
      when(mockApiManager.put(
        endpoint: anyNamed('endpoint'),
        headers: anyNamed('headers'),
        data: anyNamed('data'),
      )).thenAnswer(
        (_) async => Response(
          data: cartResponse.toJson(),
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await datasource.updateProductQuantity(
        productId: productId,
        quantity: quantity,
      );

      expect(result, isA<SuccessApiResult<CartResponse>>());
      expect((result as SuccessApiResult<CartResponse>).data?.message,
          equals(message));
    });
  });
}
