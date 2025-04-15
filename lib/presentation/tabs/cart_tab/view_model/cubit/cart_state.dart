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
  CartResponse cartItems;
  GetCartItemsSuccessState({required this.cartItems});
}

// ignore: must_be_immutable
final class GetCartItemsErrorState extends CartState {
  String message;
  GetCartItemsErrorState({required this.message});
}

final class GetCartItemsLoadingState extends CartState {}

final class RemoveFromCartSuccessState extends CartState {}

// ignore: must_be_immutable
final class RemoveFromCartErrorState extends CartState {
  String message;
  RemoveFromCartErrorState({required this.message});
}

final class RemoveFromCartLoadingState extends CartState {}

final class UpdateProductQuantitySuccessState extends CartState {}

// ignore: must_be_immutable
final class UpdateProductQuantityErrorState extends CartState {
  String message;
  UpdateProductQuantityErrorState({required this.message});
}
