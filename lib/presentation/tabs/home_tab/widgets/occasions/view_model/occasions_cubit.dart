// ignore_for_file: non_constant_identifier_names

import 'package:flora_mart/domain/entity/occassions_entity/OccasionsResponse.dart';
import 'package:flora_mart/domain/usecase/get_all_products_usecase.dart';
import 'package:flora_mart/domain/usecase/occasions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api/api_result.dart';
import '../../../../../../data/model/products/Products.dart';
import 'occasions_intent.dart';
import 'occasions_state.dart';

@injectable
class OccasionsCubit extends Cubit<OccasionsState> {
  final OccassionsUsecase getHomeOccasionUseCase;
  final GetAllProductsUsecase getAllProductsUsecase;

  OccasionsCubit(
    this.getHomeOccasionUseCase,
    this.getAllProductsUsecase,
  ) : super(OccasionsInitial());

  static OccasionsCubit get(context) => BlocProvider.of(context);

  void doIntent(OccasionsIntent occasionsIntent) {
    switch (occasionsIntent) {
      case GetProductIntent():
        _GetProducts(intent: occasionsIntent);
        break;
      case GetOccaisonIntent():
        _getHomeOccasion(intent: occasionsIntent);
        break;
    }
  }

  _getHomeOccasion({required GetOccaisonIntent intent}) async {
    emit(GetOccasionLoading());
    final result = await getHomeOccasionUseCase.invoke();
    if (result is SuccessApiResult<OccasiosnResponseEntity>) {
      emit(GetOccasionSuccess(occasions: result.data));
    } else if (result is ErrorApiResult<OccasiosnResponseEntity>) {
      emit(GetOccasionError(message: result.exception.toString()));
    } else {
      emit(GetOccasionError(message: "Unknown error occurred"));
    }
  }

  _GetProducts({required GetProductIntent intent}) async {
    emit(GetProductsLoading());

    final result = await getAllProductsUsecase.execute(
      intent.typeId,
      "occasion",
    );

    if (result is SuccessApiResult<List<Products>>) {
      emit(GetProductsSuccess(result.data ?? []));
    } else if (result is ErrorApiResult<List<Products>>) {
      emit(GetProductsError("Error: ${result.exception}"));
    } else {
      emit(GetProductsError("Unknown error occurred"));
    }
  }
}
