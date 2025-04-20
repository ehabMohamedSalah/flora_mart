import 'package:flora_mart/core/constant.dart';
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
  final TextEditingController NameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
  bool isGift = true;
  String? selectedAddressId;
  Address? selectedAddress;
  String? selectedPaymentWayId;

  void doIntent(CheckoutIntent intent) {
    switch (intent) {
      case SelectAddressIntent():
        _selectAddress(intent);
        break;
      case SelectPaymentWayIntent():
        _selectPaymentWay(intent.id);
        break;
      case InitAddressIntent():
        _initSelection();
        break;
      case InitPaymentWayIntent():
        _initPaymentWay();
        break;
      case SelectGiftIntent():
        _toggleGiftSwitch(intent.isSelected);
        break;
    }
  }

  void _initSelection() {
    if (addresses.isNotEmpty) {
      selectedAddressId = addresses.first.sId ?? "";
      emit(CheckoutAddressSelected());
    } else {
      emit(CheckoutNoAddressesFound());
    }
  }

  void _initPaymentWay() {
    selectedPaymentWayId = Constant.cacheOnDelivery;
    emit(CheckoutPaymentWaySelected());
  }

  void _selectAddress(SelectAddressIntent intent) {
    selectedAddressId = intent.id;
    selectedAddress = intent.address;
    emit(CheckoutAddressSelected());
  }

  void _selectPaymentWay(String id) {
    selectedPaymentWayId = id;
    emit(CheckoutPaymentWaySelected());
    print(id);
  }

  void _toggleGiftSwitch(bool value) {
    isGift = value;
    emit(UpdateGiftSwitchState());
  }
}
