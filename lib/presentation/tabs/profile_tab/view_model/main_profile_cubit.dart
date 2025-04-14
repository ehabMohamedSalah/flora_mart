import 'package:bloc/bloc.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';
import 'package:flora_mart/domain/usecase/get_profile_details_usecase.dart';
import 'package:flora_mart/presentation/tabs/profile_tab/view_model/main_profile_intent.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'main_profile_state.dart';

@injectable
class MainProfileCubit extends Cubit<MainProfileState> {
  final GetProfileDetailsUsecase getProfileDetailsUsecase;

  MainProfileCubit(this.getProfileDetailsUsecase) : super(MainProfileInitial());

  Future<void> onIntent(MainProfileIntent intent) async {
    if (intent is DataProfileCubitIntent) {
      await _getProfileData(intent);
    }
  }

  Future<void> _getProfileData(DataProfileCubitIntent intent) async {
    emit(MainProfileLoading());

    final result = await getProfileDetailsUsecase(
      firstName: intent.firstName,
      email: intent.email,
    );

    if (result is SuccessApiResult<GetLoggedUserDataEntity>) {
      emit(MainProfileSuccess(result.data!));
    } else if (result is ErrorApiResult<GetLoggedUserDataEntity>) {
      emit(MainProfileFailure(result.exception.toString()));
    } else {
      emit(MainProfileFailure("Unknown error occurred"));
    }
  }
}
