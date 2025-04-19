// lib/presentation/tabs/profile_tab/edit_profile/view_model/edit_profile_cubit.dart
// ignore_for_file: unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';
import 'package:flora_mart/domain/usecase/edit_profile_usecase.dart';
import 'package:flora_mart/domain/usecase/upload_photo_usecase.dart';
import 'package:flora_mart/presentation/edit_profile_screen/view_model/edit_profile_intent.dart';
import 'package:flora_mart/presentation/edit_profile_screen/view_model/edit_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUsecase editProfileUsecase;
  final UploadPhotoUsecase uploadPhotoUsecase;

  EditProfileCubit(this.editProfileUsecase, this.uploadPhotoUsecase)
      : super(EditProfileInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);

  void onIntent(EditProfileIntent intent) {
    switch (intent) {
      case UpdateProfileIntent():
        _handleUpdateProfile(intent);
        break;
      case UploadPhotoIntent():
        _handleUploadPhoto(intent);
        break;
    }
  }

  Future<void> _handleUpdateProfile(UpdateProfileIntent intent) async {
    emit(EditProfileLoading());

    final result = await editProfileUsecase.call(
      firstName: intent.firstName,
      lastName: intent.lastName,
      email: intent.email,
      phone: intent.phone,
      gender: intent.gender,
    );

    switch (result) {
      case SuccessApiResult(data: final GetLoggedUserDataEntity? data):
        if (data != null) {
          emit(EditProfileSuccess(data));
        } else {
          emit(EditProfileFailure("Update failed: No data received"));
        }
      case ErrorApiResult(exception: final error):
        emit(EditProfileFailure(error.toString()));
    }
  }

  Future<void> _handleUploadPhoto(UploadPhotoIntent intent) async {
    try {
      emit(EditProfileLoading());

      final result = await uploadPhotoUsecase.call(photoPath: intent.photoPath);

      switch (result) {
        case SuccessApiResult(data: final String? data):
          if (data != null && data.isNotEmpty) {
            emit(PhotoUploadSuccess(data));
          } else {
            emit(PhotoUploadFailure("No photo URL received from server"));
          }
        case ErrorApiResult(exception: final error):
          emit(PhotoUploadFailure(error.toString()));
      }
    } catch (e) {
      emit(PhotoUploadFailure("An unexpected error occurred"));
    }
  }
}
