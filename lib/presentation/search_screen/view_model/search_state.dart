import 'package:flora_mart/data/model/products/Products.dart';

sealed class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<Products> products;
  SearchLoadedState({required this.products});
}

class SearchErrorState extends SearchState {
  final String message;
  SearchErrorState({required this.message});
}
