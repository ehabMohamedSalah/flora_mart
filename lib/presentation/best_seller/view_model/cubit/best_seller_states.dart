part of 'best_seller_cubit.dart';

@immutable
sealed class BestSellerStates {}

final class BestSellerInitial extends BestSellerStates {}

final class GetBestSellersLoading extends BestSellerStates {}

final class GetBestSellersSuccess extends BestSellerStates {
  final List<BestSellerModel> bestSellers;

  GetBestSellersSuccess({required this.bestSellers});
}

final class GetBestSellersError extends BestSellerStates {
  final String message;

  GetBestSellersError({required this.message});
}