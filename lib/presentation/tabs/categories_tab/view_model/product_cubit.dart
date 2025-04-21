import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/usecase/filter_usecase.dart';
import 'package:flora_mart/domain/usecase/get_all_products_usecase.dart';
import 'package:flora_mart/domain/usecase/search_usecase.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_intent.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  @factoryMethod
  final GetAllProductsUsecase getAllProductsUsecase;
  final FilterUsecase filterUsecase;
  final SearchUsecase searchUsecase;

  ProductCubit(this.getAllProductsUsecase,this.filterUsecase,this.searchUsecase) : super(ProductInitial());

  Future<void> _getProducts(String typeId,String type) async {
    emit(ProductLoadingState());
    final result = await getAllProductsUsecase.execute(typeId,type);

    switch (result) {
      case SuccessApiResult():
        emit(ProductLoadedState(products: result.data ?? []));
      case ErrorApiResult():
        emit(ProductErrorState(message: result.exception.toString()));
    }
  }

  Future<void> _getProductsBasedOnFilter(String filter) async {
    emit(ProductLoadingState());
    final result = await filterUsecase.execute(filter);

    switch (result) {
      case SuccessApiResult():
        emit(ProductLoadedState(products: result.data ?? []));
      case ErrorApiResult():
        emit(ProductErrorState(message: result.exception.toString()));
    }
  }

  Future<void> _getProductsBasedOnSearchQuery(String searchQuery) async {
    emit(ProductLoadingState());
    final result = await searchUsecase.execute(searchQuery);

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
        _getProducts(intent.typeId,intent.type);
        break;
      case GetProductsBasedOnFilterIntent():
        _getProductsBasedOnFilter(intent.filter);
        break;
      case GetProductsBasedOnSearchQueryIntent():
        _getProductsBasedOnSearchQuery(intent.searchQuery);
        break;
    }
  }
}