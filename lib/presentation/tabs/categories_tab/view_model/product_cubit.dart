import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/usecase/get_all_products_usecase.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_intent.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetAllProductsUsecase getAllProductsUsecase;

  ProductCubit({required this.getAllProductsUsecase}) : super(ProductInitial());

  Future<void> _getProducts(String categoryId) async {
    emit(ProductLoadingState());
    final result = await getAllProductsUsecase.execute(categoryId);

    switch (result) {
      case SuccessApiResult():
        emit(ProductLoadedState(products: result.data ?? []));
      case ErrorApiResult():
        emit(ProductErrorState(message: result.exception.toString()));
    }
  }

  void doIntent(ProductIntent intent) {
    switch (intent) {
      case GetProductsIntent():
        _getProducts(intent.categoryId);
        break;
    }
  }
}