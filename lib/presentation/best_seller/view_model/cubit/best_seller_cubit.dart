import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/BestSellerModel.dart';
import 'package:flora_mart/domain/usecase/get_best_sellers_usecase.dart';
import 'package:flora_mart/presentation/best_seller/view_model/cubit/best_seller_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'best_seller_states.dart';

@injectable
class BestSellerCubit extends Cubit<BestSellerStates> {
  final GetBestSellersUseCase getBestSellersUseCase;

  BestSellerCubit(this.getBestSellersUseCase) : super(BestSellerInitial());

  static BestSellerCubit get(context) => BlocProvider.of(context);

  void doIntent(BestSellerIntent intent) {
    switch (intent) {
      case GetBestSellersIntent():
        _getBestSellers(intent: intent);
        break;
    }
  }

  _getBestSellers({required GetBestSellersIntent intent}) async {
    emit(GetBestSellersLoading());
    final result = await getBestSellersUseCase.invoke();

    switch (result) {
      case SuccessApiResult(data: final data):
        emit(GetBestSellersSuccess(bestSellers: data ?? []));
      case ErrorApiResult(exception: final error):
        emit(GetBestSellersError(message: error.toString()));
    }
  }
}
