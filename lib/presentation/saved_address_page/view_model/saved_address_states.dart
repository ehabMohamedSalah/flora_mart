part of 'saved_address_cuibt.dart';

@immutable
sealed class SavedAddressState {}

final class SavedAddressInitial extends SavedAddressState {}

final class GetSavedAddressSuccessState extends SavedAddressState {
  final GetSavedAddressResponce? getSavedAddressResponce;

  GetSavedAddressSuccessState({required this.getSavedAddressResponce});
}

final class GetSavedAddressLoadingState extends SavedAddressState {}

final class GetSavedAddressErrorState extends SavedAddressState {
  final String? message;

  GetSavedAddressErrorState({required this.message});
}

final class DeleteSavedAddressSuccessState extends SavedAddressState {
  final bool? isDeleted;

  DeleteSavedAddressSuccessState({required this.isDeleted});
}

final class DeleteSavedAddressLoadingState extends SavedAddressState {}

final class DeleteSavedAddressErrorState extends SavedAddressState {
  final String? message;

  DeleteSavedAddressErrorState({required this.message});
}
