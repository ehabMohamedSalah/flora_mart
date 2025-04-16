import 'package:bloc_test/bloc_test.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/add_to_cart_usecase.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/get_cart_items_usecase.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/remove_from_cart_usecase.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/update_product_quantity_usecase.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_cubit.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_intent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

class MockAddToCartUsecase extends Mock implements AddToCartUsecase {}

class MockGetCartItemsUsecase extends Mock implements GetCartItemsUsecase {}

class MockRemoveFromCartUsecase extends Mock implements RemoveFromCartUsecase {}

class MockUpdateProductQuantityUsecase extends Mock
    implements UpdateProductQuantityUsecase {}

class MockLogger extends Mock implements Logger {}

void main() {
  late CartCubit cartCubit;
  late MockAddToCartUsecase addToCartUsecase;
  late MockGetCartItemsUsecase getCartItemsUsecase;
  late MockRemoveFromCartUsecase removeFromCartUsecase;
  late MockUpdateProductQuantityUsecase updateProductQuantityUsecase;
  late MockLogger logger;

  setUp(() {
    addToCartUsecase = MockAddToCartUsecase();
    getCartItemsUsecase = MockGetCartItemsUsecase();
    removeFromCartUsecase = MockRemoveFromCartUsecase();
    updateProductQuantityUsecase = MockUpdateProductQuantityUsecase();
    logger = MockLogger();

    cartCubit = CartCubit(
      addToCartUsecase,
      getCartItemsUsecase,
      logger,
      removeFromCartUsecase,
      updateProductQuantityUsecase,
    );
  });

  blocTest<CartCubit, CartState>(
    'emits [AddToCartLoadingState, GetCartItemsLoadingState, GetCartItemsSuccessState, AddToCartSuccessState] when AddToCartIntent is successful',
    build: () {
      when(() => addToCartUsecase.call(productId: "1", quantity: 2))
          .thenAnswer((_) async => SuccessApiResult(null));
      when(() => getCartItemsUsecase.call()).thenAnswer(
          (_) async => SuccessApiResult(CartResponse(numOfCartItems: 1)));

      return cartCubit;
    },
    act: (cubit) =>
        cubit.doIntent(AddToCartIntent(productId: "1", quantity: 2)),
    expect: () => [
      AddToCartLoadingState(),
      GetCartItemsLoadingState(),
      isA<GetCartItemsSuccessState>(),
      AddToCartSuccessState(),
    ],
  );

  blocTest<CartCubit, CartState>(
    'emits [GetCartItemsLoadingState, GetCartItemsSuccessState] when GetCartItemsIntent is successful',
    build: () {
      when(() => getCartItemsUsecase.call()).thenAnswer(
        (_) async => SuccessApiResult(CartResponse(numOfCartItems: 2)),
      );
      return cartCubit;
    },
    act: (cubit) => cubit.doIntent(GetCartItemsIntent()),
    expect: () => [
      GetCartItemsLoadingState(),
      isA<GetCartItemsSuccessState>(),
    ],
  );

  blocTest<CartCubit, CartState>(
    'emits [AddToCartLoadingState, AddToCartErrorState] when AddToCartIntent fails',
    build: () {
      when(() => addToCartUsecase.call(productId: "1", quantity: 1)).thenAnswer(
        (_) async => ErrorApiResult(Exception("Error adding to cart")),
      );
      return cartCubit;
    },
    act: (cubit) =>
        cubit.doIntent(AddToCartIntent(productId: "1", quantity: 1)),
    expect: () => [
      AddToCartLoadingState(),
      isA<AddToCartErrorState>(),
    ],
  );
}
