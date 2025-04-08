part of 'home_cubit.dart';

@immutable
sealed class HomeStates {}

final class HomeInitial extends HomeStates {}

/// Home Categories States ///
final class GetHomeDataInitial extends HomeStates {}

final class GetHomeDataLoading extends HomeStates {}

final class GetHomeDataSuccess extends HomeStates {
  final HomeResponse? homeResponse;

  GetHomeDataSuccess({required this.homeResponse});
}

final class GetHomeDataError extends HomeStates {
  final String message;

  GetHomeDataError({required this.message});
}
