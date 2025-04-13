import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/cart/CartItems.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/add_to_cart_usecase.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/get_cart_items_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this.addToCartUsecase, this.getCartItemsUsecase)
      : super(CartInitial());
  final AddToCartUsecase addToCartUsecase;
  final GetCartItemsUsecase getCartItemsUsecase;

  static CartCubit get(context) => BlocProvider.of(context);
  var logger = Logger();
  addToCard({required String productId, required int quantity}) async {
    emit(AddToCartLoadingState());
    var result =
        await addToCartUsecase.call(productId: productId, quantity: quantity);
    switch (result) {
      case SuccessApiResult():
        emit(AddToCartSuccessState());
        break;
      case ErrorApiResult():
        logger.e(result.exception.toString());
        emit(AddToCartErrorState(message: result.exception.toString()));
        break;
    }
  }

  getCartItems() async {
    emit(GetCartItemsLoadingState());
    var result = await getCartItemsUsecase.call();
    switch (result) {
      case SuccessApiResult():
        emit(GetCartItemsSuccessState(cartItems: result.data ?? []));
        break;
      case ErrorApiResult():
        logger.e(result.exception.toString());
        emit(GetCartItemsErrorState(message: result.exception.toString()));
        break;
    }
  }
}
