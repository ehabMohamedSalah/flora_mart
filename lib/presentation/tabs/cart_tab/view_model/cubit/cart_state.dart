part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class AddToCartSuccessState extends CartState {}

final class AddToCartErrorState extends CartState {
  String message;
  AddToCartErrorState({required this.message});
}

final class AddToCartLoadingState extends CartState {}
