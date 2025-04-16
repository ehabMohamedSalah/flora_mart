// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/repo_contract/cart_repo/cart_repo.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/add_to_cart_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_to_cart_usecase_test.mocks.dart';

@GenerateMocks([CartRepo])
void main() {
  group('AddToCartUsecase', () {
    late AddToCartUsecase usecase;
    late MockCartRepo mockCartRepo;

    setUp(() {
      mockCartRepo = MockCartRepo();
      usecase = AddToCartUsecase(mockCartRepo);
    });

    test(
        'when calling call function should call addToCart function from CartRepo',
        () async {
      const productId = '1';
      const quantity = 2;
      final result = SuccessApiResult<dynamic>('Added to cart');
      provideDummy<ApiResult<dynamic>>(result);

      when(mockCartRepo.addToCart(productId: productId, quantity: quantity))
          .thenAnswer((_) async => result);

      final actual =
          await usecase.call(productId: productId, quantity: quantity);

      verify(mockCartRepo.addToCart(productId: productId, quantity: quantity))
          .called(1);
      expect(actual, equals(result));
    });
  });
}
