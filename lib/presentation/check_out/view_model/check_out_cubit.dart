import 'package:flora_mart/data/model/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'check_out_intents.dart';

part 'check_out_states.dart';

@injectable
class CheckoutCubit extends Cubit<CheckoutStates> {
  CheckoutCubit() : super(CheckoutInitial());

  static CheckoutCubit get(context) => BlocProvider.of(context);

  List<Address> addresses = [
    Address(
      street: "123 Nile Street",
      phone: "+201234567890",
      city: "Cairo",
      lat: "30.0444",
      long: "31.2357",
      username: "Kareem Hekal",
      sId: "1",
    ),
    Address(
      street: "456 Tahrir Street",
      phone: "+201098765432",
      city: "Giza",
      lat: "30.0131",
      long: "31.2089",
      username: "Ali Mahmoud",
      sId: "2",
    ),
  ];

  String? selectedAddressId;

  void doIntent(CheckoutIntent intent) {
    switch (intent) {
      case SelectAddressIntent():
        _selectAddress(intent.id);
        break;
      case InitAddressIntent():
        _initSelection();
        break;
    }
  }

  void _initSelection() {
    if (addresses.isNotEmpty) {
      selectedAddressId = addresses.first.sId ?? "";
      emit(CheckoutAddressSelected(selectedId: selectedAddressId!));
    } else {
      emit(CheckoutNoAddressesFound());
    }
  }

  void _selectAddress(String id) {
    selectedAddressId = id;
    emit(CheckoutAddressSelected(selectedId: selectedAddressId!));
  }
}
