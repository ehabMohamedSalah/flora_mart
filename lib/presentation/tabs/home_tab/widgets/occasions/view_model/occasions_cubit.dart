import 'package:bloc/bloc.dart';
import 'package:flora_mart/data/model/occasions/Occasions.dart';
import 'package:flora_mart/domain/entity/occassions_entity/OccasionsResponse.dart';
import 'package:flora_mart/domain/usecase/occasions_usecase.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api/api_result.dart';
import 'occasions_intent.dart';
import 'occasions_state.dart';



@injectable
class OccasionsCubit extends Cubit<OccasionsState> {

  final OccassionsUsecase getHomeOccasionUseCase;

  OccasionsCubit(
      this.getHomeOccasionUseCase
      )
      : super(OccasionsInitial());

  static OccasionsCubit get(context) => BlocProvider.of(context);

  void doIntent(OccasionsIntent occasionsIntent) {
    switch (occasionsIntent) {

      case GetOccaisonIntent():
        _getHomeOccasion(intent: occasionsIntent);
        break;
    }
  }


  _getHomeOccasion({required GetOccaisonIntent intent}) async {
    emit(GetOccasionLoading());
    final result = await getHomeOccasionUseCase.invoke();
    print(result);
    if (result is SuccessApiResult<OccasiosnResponseEntity>)

    {
      print("success");
      emit(GetOccasionSuccess(occasions: result.data));
    }
    else if (result is ErrorApiResult<OccasiosnResponseEntity>)
    {
      print("fail");
      print( result.exception.toString());

      emit(GetOccasionError(message: result.exception.toString()));
    }else{
      print("fail");
      emit(GetOccasionError(message: "Unknown error occurred"));

    }
  }}