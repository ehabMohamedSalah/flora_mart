// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flora_mart/domain/repo_contract/cart_repo/cart_repo.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/get_cart_items_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cart_items_usecase_test.mocks.dart';

@GenerateMocks([CartRepo])
void main() {
  group('GetCartItemsUsecase', () {
    late GetCartItemsUsecase usecase;
    late MockCartRepo mockCartRepo;

    setUp(() {
      mockCartRepo = MockCartRepo();
      usecase = GetCartItemsUsecase(mockCartRepo);
    });

    test(
        'when calling call function should call getCartItems function from CartRepo',
        () async {
      final result = SuccessApiResult(CartResponse());
      provideDummy<ApiResult<CartResponse>>(result);

      when(mockCartRepo.getCartItems()).thenAnswer((_) async => result);

      final actual = await usecase.call();

      verify(mockCartRepo.getCartItems()).called(1);
      expect(actual, equals(result));
    });
  });
}
