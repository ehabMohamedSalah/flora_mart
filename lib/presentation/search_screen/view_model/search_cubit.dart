import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/usecase/filter_usecase.dart';
import 'package:flora_mart/domain/usecase/get_all_products_usecase.dart';
import 'package:flora_mart/domain/usecase/search_usecase.dart';
import 'package:flora_mart/presentation/search_screen/view_model/search_intent.dart';
import 'package:flora_mart/presentation/search_screen/view_model/search_state.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_intent.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  @factoryMethod
  final SearchUsecase searchUsecase;

  SearchCubit(this.searchUsecase) : super(SearchInitial());

  Future<void> _getProductsBasedOnFilter(String searchQuery) async {
    emit(SearchLoadingState());
    final result = await searchUsecase.execute(searchQuery);

    switch (result) {
      case SuccessApiResult():
        emit(SearchLoadedState(products: result.data ?? []));
      case ErrorApiResult():
        emit(SearchErrorState(message: result.exception.toString()));
    }
  }

  void doIntent(SearchIntent intent) {
    switch (intent) {
      case GetProductsBasedOnSearchQueryIntent():
        _getProductsBasedOnFilter(intent.searchQuery);
        break;
    }
  }
}