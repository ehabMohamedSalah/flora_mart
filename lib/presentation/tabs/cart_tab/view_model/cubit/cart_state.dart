part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class AddToCartSuccessState extends CartState {}

// ignore: must_be_immutable
final class AddToCartErrorState extends CartState {
  String message;
  AddToCartErrorState({required this.message});
}

final class AddToCartLoadingState extends CartState {}

// ignore: must_be_immutable
final class GetCartItemsSuccessState extends CartState {
  List<CartItems> cartItems;
  GetCartItemsSuccessState({required this.cartItems});
}

// ignore: must_be_immutable
final class GetCartItemsErrorState extends CartState {
  String message;
  GetCartItemsErrorState({required this.message});
}

final class GetCartItemsLoadingState extends CartState {}
