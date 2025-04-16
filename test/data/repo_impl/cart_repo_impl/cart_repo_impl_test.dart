import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/cart_datasource/cart_datasource.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flora_mart/data/repo_impl/cart_repo_impl/cart_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_repo_impl_test.mocks.dart';

@GenerateMocks([CartDatasource])
void main() {
  group('CartRepoImpl', () {
    late CartRepoImpl repo;
    late MockCartDatasource mockDatasource;

    setUp(() {
      mockDatasource = MockCartDatasource();
      repo = CartRepoImpl(mockDatasource);
    });

    test('addToCart should call addToCart in datasource', () async {
      const productId = '123';
      const quantity = 2;
      final result = SuccessApiResult<dynamic>(
          CartResponse(message: 'Success', cart: null));
      provideDummy<ApiResult<dynamic>>(result);

      when(mockDatasource.addToCart(productId: productId, quantity: quantity))
          .thenAnswer((_) async => result);

      final actual =
          await repo.addToCart(productId: productId, quantity: quantity);

      expect(actual, equals(result));
      verify(mockDatasource.addToCart(productId: productId, quantity: quantity))
          .called(1);
    });

    test('getCartItems should call getCartItems in datasource', () async {
      final result = SuccessApiResult<CartResponse>(
          CartResponse(message: 'Success', cart: null));
      provideDummy<ApiResult<CartResponse>>(result);

      when(mockDatasource.getCartItems()).thenAnswer((_) async => result);

      final actual = await repo.getCartItems();

      expect(actual, equals(result));
      verify(mockDatasource.getCartItems()).called(1);
    });

    test('removeFromCart should call removeFromCart in datasource', () async {
      const productId = '123';
      final result = SuccessApiResult<CartResponse>(
          CartResponse(message: 'Success', cart: null));
      provideDummy<ApiResult<CartResponse>>(result);

      when(mockDatasource.removeFromCart(productId: productId))
          .thenAnswer((_) async => result);

      final actual = await repo.removeFromCart(productId: productId);

      expect(actual, equals(result));
      verify(mockDatasource.removeFromCart(productId: productId)).called(1);
    });

    test(
        'updateProductQuantity should call updateProductQuantity in datasource',
        () async {
      const productId = '123';
      const quantity = 5;
      final result = SuccessApiResult<CartResponse>(
          CartResponse(message: 'Updated', cart: null));
      provideDummy<ApiResult<CartResponse>>(result);

      when(mockDatasource.updateProductQuantity(
              productId: productId, quantity: quantity))
          .thenAnswer((_) async => result);

      final actual = await repo.updateProductQuantity(
          productId: productId, quantity: quantity);

      expect(actual, equals(result));
      verify(mockDatasource.updateProductQuantity(
              productId: productId, quantity: quantity))
          .called(1);
    });
  });
}
