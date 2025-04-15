import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/add_to_cart_usecase.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/get_cart_items_usecase.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/remove_from_cart_usecase.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/update_product_quantity_usecase.dart';
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

  static CartCubit get(context) => BlocProvider.of(context);
  addToCard({required String productId, required int quantity}) async {
    emit(AddToCartLoadingState());
    var result =
        await _addToCartUsecase.call(productId: productId, quantity: quantity);
    switch (result) {
      case SuccessApiResult():
        getCartItems();
        emit(AddToCartSuccessState());
        break;
      case ErrorApiResult():
        _logger.e(result.exception.toString());
        emit(AddToCartErrorState(message: result.exception.toString()));
        break;
    }
  }

  int productCount = 0;

  getCartItems() async {
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

  removeFromCart({required String productId}) async {
    emit(RemoveFromCartLoadingState());
    var result = await _removeFromCartUsecase.call(productId: productId);
    switch (result) {
      case SuccessApiResult():
        getCartItems();
        emit(RemoveFromCartSuccessState());
        break;
      case ErrorApiResult():
        _logger.e(result.exception.toString());
        emit(RemoveFromCartErrorState(message: result.exception.toString()));
        break;
    }
  }

  updateProductQuantity(
      {required String productId, required int quantity}) async {
    var result = await _updateProductQuantityUsecase.call(
        productId: productId, quantity: quantity);
    switch (result) {
      case SuccessApiResult():
        await getCartItems();
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
