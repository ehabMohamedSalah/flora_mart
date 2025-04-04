import 'package:bloc/bloc.dart';
import 'package:flora_mart/data/model/occasions/Occasions.dart';
import 'package:flora_mart/domain/entity/occassions_entity/OccasionsResponse.dart';
import 'package:flora_mart/domain/usecase/occasions_usecase.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_result.dart';

part 'home_states.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  // final GetHomeCategoriesUseCase getHomeCategoriesUseCase;
  // final GetHomeBestSellerUseCase getHomeBestSellerUseCase;
   final OccassionsUsecase getHomeOccasionUseCase;

  HomeCubit(// this.getHomeCategoriesUseCase,
      // this.getHomeBestSellerUseCase,
       this.getHomeOccasionUseCase
      )
      : super(HomeInitial());

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

  _getHomeOccasion({required GetHomeOccaisonIntent intent}) async {
    emit(GetHomeOccasionLoading());
    final result = await getHomeOccasionUseCase.invoke();
    print(result);
    if (result is SuccessApiResult<OccasiosnResponseEntity>)

        {
          print("success");
          emit(GetHomeOccasionSuccess(occasions: result.data));
        }
    else if (result is ErrorApiResult<OccasiosnResponseEntity>)
         {
          print("fail");
          print( result.exception.toString());

          emit(GetHomeOccasionError(message: result.exception.toString()));
        }else{
          print("fail");
          emit(GetHomeOccasionError(message: "Unknown error occurred"));

    }
  }}