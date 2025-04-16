// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flora_mart/domain/repo_contract/cart_repo/cart_repo.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/remove_from_cart_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remove_from_cart_usecase_test.mocks.dart';

@GenerateMocks([CartRepo])
void main() {
  group('RemoveFromCartUsecase', () {
    late RemoveFromCartUsecase usecase;
    late MockCartRepo mockCartRepo;

    setUp(() {
      mockCartRepo = MockCartRepo();
      usecase = RemoveFromCartUsecase(mockCartRepo);
    });

    test(
        'when calling call function should call removeFromCart function from CartRepo',
        () async {
      const productId = '1';
      final result = SuccessApiResult(CartResponse());
      provideDummy<ApiResult<CartResponse>>(result);

      when(mockCartRepo.removeFromCart(productId: productId))
          .thenAnswer((_) async => result);

      final actual = await usecase.call(productId: productId);

      verify(mockCartRepo.removeFromCart(productId: productId)).called(1);
      expect(actual, equals(result));
    });
  });
}
