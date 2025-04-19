// lib/presentation/tabs/profile_tab/edit_profile/view_model/edit_profile_state.dart
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';

sealed class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final GetLoggedUserDataEntity userData;
  EditProfileSuccess(this.userData);
}

class EditProfileFailure extends EditProfileState {
  final String message;
  EditProfileFailure(this.message);
}

class PhotoUploadSuccess extends EditProfileState {
  final String photoUrl;
  PhotoUploadSuccess(this.photoUrl);
}

class PhotoUploadFailure extends EditProfileState {
  final String message;
  PhotoUploadFailure(this.message);
}
