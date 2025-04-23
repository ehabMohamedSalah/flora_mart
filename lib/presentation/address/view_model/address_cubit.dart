import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/usecase/add_address_usecase.dart';
import 'package:flora_mart/presentation/address/view_model/address_intent.dart';
import 'package:flora_mart/presentation/address/view_model/address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora_mart/domain/usecase/update_address_usecase.dart';
import 'package:flora_mart/domain/entity/address_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressCubit extends Cubit<AddressState> {
  final UpdateAddressUseCase _updateAddressUseCase;
  final AddAddressUseCase _addAddressUseCase;

  AddressCubit(this._updateAddressUseCase, this._addAddressUseCase)
      : super(AddressInitialState());

  Future<void> doIntent(AddressIntent intent) async {
    if (intent is UpdateAddressIntent) {
      await _handleUpdateAddress(intent);
    }
    if (intent is AddAddressIntent) {
      await _handleAddAddress(intent);
    }
  }

  Future<void> _handleUpdateAddress(UpdateAddressIntent intent) async {
    try {
      emit(UpdateAddressLoadingState());

      final result = await _updateAddressUseCase.call(
        addressId: intent.addressId,
        address: AddressEntity(
          id: intent.addressId,
          street: intent.street.trim(),
          phone: intent.phone.trim(),
          city: intent.city.trim(),
          lat: intent.latitude.toString(),
          long: intent.longitude.toString(),
          username: intent.recipientName.trim(),
        ),
      );

      switch (result) {
        case SuccessApiResult():
          emit(UpdateAddressSuccessState());
        case ErrorApiResult(exception: final error):
          emit(UpdateAddressErrorState(error.toString()));
      }
    } catch (e) {
      emit(UpdateAddressErrorState(
          'An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> _handleAddAddress(AddAddressIntent intent) async {
    try {
      emit(addAddressLoadingState());

      final result = await _addAddressUseCase.call(
        address: AddressEntity(
          id: '',
          street: intent.street.trim(),
          phone: intent.phone.trim(),
          city: intent.city.trim(),
          lat: intent.latitude.toString(),
          long: intent.longitude.toString(),
          username: intent.recipientName.trim(),
        ),
      );

      switch (result) {
        case SuccessApiResult():
          emit(addAddressSuccessState());
        case ErrorApiResult(exception: final error):
          emit(UpdateAddressErrorState(error.toString()));
      }
    } catch (e) {
      emit(UpdateAddressErrorState(
          'An unexpected error occurred: ${e.toString()}'));
    }
  }
}
