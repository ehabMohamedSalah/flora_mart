

part of 'home_cubit.dart';


@immutable
sealed class HomeStates {}

final class HomeInitial extends HomeStates {}


/// Home Categories States ///
final class GetHomeCategoriesInitial extends HomeStates {}

final class GetHomeCategoriesLoading extends HomeStates {}

final class GetHomeCategoriesSuccess extends HomeStates {
  final List<String> categories;

  GetHomeCategoriesSuccess({required this.categories});
}

final class GetHomeCategoriesError extends HomeStates {
  final String message;

  GetHomeCategoriesError({required this.message});
}

/// Home Best Seller States ///
final class GetHomeBestSellerInitial extends HomeStates {}

final class GetHomeBestSellerLoading extends HomeStates {}

final class GetHomeBestSellerSuccess extends HomeStates {
  final List<String> bestSellers;

  GetHomeBestSellerSuccess({required this.bestSellers});
}

final class GetHomeBestSellerError extends HomeStates {
  final String message;

  GetHomeBestSellerError({required this.message});
}

/// Home Occasion States ///
final class GetHomeOccasionInitial extends HomeStates {}

final class GetHomeOccasionLoading extends HomeStates {}

final class GetHomeOccasionSuccess extends HomeStates {
  OccasiosnResponseEntity? occasions;
  GetHomeOccasionSuccess({required this.occasions});
}

final class GetHomeOccasionError extends HomeStates {
  final String message;

  GetHomeOccasionError({required this.message});
}