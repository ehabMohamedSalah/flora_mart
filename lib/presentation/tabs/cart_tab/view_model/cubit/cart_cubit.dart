import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/add_to_cart_usecase.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/get_cart_items_usecase.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/remove_from_cart_usecase.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/update_product_quantity_usecase.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_intent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this._addToCartUsecase, this._getCartItemsUsecase, this._logger,
      this._removeFromCartUsecase, this._updateProductQuantityUsecase)
      : super(CartInitial());
  @factoryMethod
  final AddToCartUsecase _addToCartUsecase;
  final GetCartItemsUsecase _getCartItemsUsecase;
  final RemoveFromCartUsecase _removeFromCartUsecase;
  final UpdateProductQuantityUsecase _updateProductQuantityUsecase;
  final Logger _logger;

  doIntent(CartIntent intent) async {
    switch (intent) {
      case GetCartItemsIntent():
        _getCartItems(GetCartItemsIntent());
        break;
      case AddToCartIntent():
        _addToCard(intent);
        break;
      case RemoveFromCartIntent():
        _removeFromCart(intent);
        break;
      case UpdateProductQuantityIntent():
        _updateProductQuantity(intent);
        break;
    }
  }

  static CartCubit get(context) => BlocProvider.of(context);
  _addToCard(AddToCartIntent intent) async {
    emit(AddToCartLoadingState());
    var result = await _addToCartUsecase.call(
        productId: intent.productId, quantity: intent.quantity);
    switch (result) {
      case SuccessApiResult():
        await _getCartItems(GetCartItemsIntent());
        emit(AddToCartSuccessState());
        break;
      case ErrorApiResult():
        _logger.e(result.exception.toString());
        emit(AddToCartErrorState(message: result.exception.toString()));
        break;
    }
  }

  int productCount = 0;

  _getCartItems(GetCartItemsIntent intent) async {
    emit(GetCartItemsLoadingState());
    var result = await _getCartItemsUsecase.call();
    switch (result) {
      case SuccessApiResult():
        productCount = (result.data?.numOfCartItems ?? 0).toInt();
        if (isClosed) return;
        emit(
            GetCartItemsSuccessState(cartItems: result.data ?? CartResponse()));
        break;
      case ErrorApiResult():
        _logger.e(result.exception.toString());
        emit(GetCartItemsErrorState(message: result.exception.toString()));
        break;
    }
  }

  _removeFromCart(RemoveFromCartIntent intent) async {
    emit(RemoveFromCartLoadingState());
    var result = await _removeFromCartUsecase.call(productId: intent.productId);
    switch (result) {
      case SuccessApiResult():
        await _getCartItems(GetCartItemsIntent());
        emit(RemoveFromCartSuccessState());
        break;
      case ErrorApiResult():
        _logger.e(result.exception.toString());
        emit(RemoveFromCartErrorState(message: result.exception.toString()));
        break;
    }
  }

  _updateProductQuantity(UpdateProductQuantityIntent intent) async {
    var result = await _updateProductQuantityUsecase.call(
        productId: intent.productId, quantity: intent.quantity);
    switch (result) {
      case SuccessApiResult():
        await _getCartItems(GetCartItemsIntent());
        emit(UpdateProductQuantitySuccessState());
        break;
      case ErrorApiResult():
        _logger.e(result.exception.toString());
        emit(UpdateProductQuantityErrorState(
            message: result.exception.toString()));
        break;
    }
  }
}
