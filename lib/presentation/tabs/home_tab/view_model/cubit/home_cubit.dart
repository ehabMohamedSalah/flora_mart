import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/Home/homeResponse.dart';
import 'package:flora_mart/domain/usecase/home_Usecase.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'home_states.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  final HomeUsecase homeUsecase;

  HomeCubit(this.homeUsecase) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  void doIntent(HomeIntent homeIntent) {
    switch (homeIntent) {
      case getHomeDataIntent():
        _getHomeData(intent: homeIntent);
        break;
    }
  }

  _getHomeData({required getHomeDataIntent intent}) async {
    var result = await homeUsecase.call();
    switch (result) {
      case SuccessApiResult():
        emit(GetHomeDataSuccess(homeResponse: result.data));
        break;
      case ErrorApiResult():
        emit(GetHomeDataError(message: result.exception.toString()));
        break;
    }
  }


}
