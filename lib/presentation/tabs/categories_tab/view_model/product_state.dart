import 'package:flora_mart/data/model/products/Products.dart';

sealed class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<Products> products;
  ProductLoadedState({required this.products});
}

class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState({required this.message});
}
