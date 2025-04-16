part of 'main_profile_cubit.dart';

@immutable
sealed class MainProfileState {}

final class MainProfileInitial extends MainProfileState {}

class MainProfileLoading extends MainProfileState {}

class MainProfileSuccess extends MainProfileState {
  final GetLoggedUserDataEntity getLoggedUserDataEntity;

  MainProfileSuccess(this.getLoggedUserDataEntity);
}

class MainProfileFailure extends MainProfileState {
  final String message;

  MainProfileFailure(this.message);
}
