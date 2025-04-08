
import 'package:bloc/bloc.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/BestSellerModel.dart';
import 'package:flora_mart/domain/usecase/get_best_sellers_usecase.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_states.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  final GetBestSellersUseCase getBestSellersUseCase;

  HomeCubit(this.getBestSellersUseCase) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  void doIntent(HomeIntent homeIntent) {
    switch (homeIntent) {
      case GetHomeCatogoriesIntent():
        _getHomeCategories(intent: homeIntent);
        break;
      case GetHomeBestSellerIntent():
        _getHomeBestSeller(intent: homeIntent);
        break;
      case GetHomeOccaisonIntent():
        _getHomeOccasion(intent: homeIntent);
        break;
    }
  }

  _getHomeCategories({required GetHomeCatogoriesIntent intent}) async {}

  _getHomeBestSeller({required GetHomeBestSellerIntent intent}) async {}

  _getHomeOccasion({required GetHomeOccaisonIntent intent}) async {}
}
