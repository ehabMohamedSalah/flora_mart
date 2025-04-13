import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:flora_mart/domain/usecase/cart_usecases/add_to_cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this.addToCartUsecase) : super(CartInitial());
  final AddToCartUsecase addToCartUsecase;

  static CartCubit get(context) => BlocProvider.of(context);
  var logger = Logger();
  addToCard({required String productId, required int quantity}) async {
    emit(AddToCartLoadingState());
    var result =
        await addToCartUsecase.call(productId: productId, quantity: quantity);
    switch (result) {
      case Success():
        emit(AddToCartSuccessState());
        break;
      case ErrorApiResult():
        logger.e(result.exception.toString());
        emit(AddToCartErrorState(message: result.exception.toString()));
        break;
      default:
    }
  }
}
