import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/getSavedAddressResponce.dart';
import 'package:flora_mart/domain/usecase/saved_address/delete_addres.dart';
import 'package:flora_mart/domain/usecase/saved_address/get_saved_Address.dart';
import 'package:flora_mart/presentation/saved_address_page/view_model/saved_address_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'saved_address_states.dart';

@injectable
class SavedAddressCubit extends Cubit<SavedAddressState> {
  @factoryMethod
  DeleteSavedAddresUseCase deleteSavedAddresUseCase;
  GetSavedAddressUseCase getSavedAddressUsecase;

  SavedAddressCubit(
    this.deleteSavedAddresUseCase,
    this.getSavedAddressUsecase,
  ) : super(SavedAddressInitial());

  void doIntent(SavedAddressIntent intent) {
    switch (intent) {
      case DeleteSavedAddressIntent():
        _deleteSavedAddress(id: intent.id);
        break;
      case GetSavedAddressIntent():
        _getSavedAddress();
        break;
    }
  }

  List<Addresses>? addresses;
  static SavedAddressCubit get(context) => BlocProvider.of(context);

  _deleteSavedAddress({required String id}) async {
    emit(DeleteSavedAddressLoadingState());
    final result = await deleteSavedAddresUseCase.invoke(id: id);
    switch (result) {
      case SuccessApiResult():
        addresses?.removeWhere((address) => address.id == id);
        emit(DeleteSavedAddressSuccessState(isDeleted: result.data));
        break;
      case ErrorApiResult():
        print("${result.exception.toString()} Error ⛔⛔");
        emit(
            DeleteSavedAddressErrorState(message: result.exception.toString()));
        break;
    }
  }

  _getSavedAddress() async {
    emit(GetSavedAddressLoadingState());
    final result = await getSavedAddressUsecase.invoke();
    switch (result) {
      case SuccessApiResult():
        addresses = result.data?.addresses ?? [];
        emit(GetSavedAddressSuccessState(getSavedAddressResponce: result.data));
        break;
      case ErrorApiResult():
        print("${result.exception.toString()} Error ⛔⛔");
        emit(GetSavedAddressErrorState(message: result.exception.toString()));
        break;
    }
  }
}
