import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/data/model/address.dart';
import 'package:flora_mart/domain/usecase/Payment_process_uesecases/cash_usecase.dart';
import 'package:flora_mart/domain/usecase/Payment_process_uesecases/credit_card_usecase.dart';
import 'package:flora_mart/presentation/check_out/view/widgets/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'check_out_intents.dart';

part 'check_out_states.dart';

@injectable
class CheckoutCubit extends Cubit<CheckoutStates> {
  final CreditCardUsecase creditCardUsecase;
  final CacheUsecase cacheUsecase;

  CheckoutCubit(this.creditCardUsecase, this.cacheUsecase)
      : super(CheckoutInitial());

  static CheckoutCubit get(context) => BlocProvider.of(context);
  final TextEditingController nameController = TextEditingController();
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
      street: "123 Nile Street",
      phone: "+201234567890",
      city: "Cairo",
      lat: "30.0444",
      long: "31.2357",
      username: "Kareem Hekal",
      sId: "1",
    ),
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
      case SelectGiftIntent():
        _toggleGiftSwitch(intent.isSelected);
        break;
      case PlaceOrderIntent():
        _placeOrderIntentPayment(intent.context, intent.formKey);
        break;
      case LaunchPaymentUrl():
        _launchPaymentUrl(
          intent.url,
          intent.context,
        );
        break;
    }
  }

  void _placeOrderIntentPayment(
      BuildContext context, GlobalKey<FormState> formKey) {
    if (selectedAddress == null) {
      toastMessage(
        message: AppStrings.pleaseSelectADeliveryAddress,
        tybeMessage: TybeMessage.negative,
      );
      return;
    }

    if (selectedPaymentWayId == null) {
      toastMessage(
        message: AppStrings.pleaseSelectAPaymentMethod,
        tybeMessage: TybeMessage.negative,
      );
      return;
    }

    final isCredit = selectedPaymentWayId == Constant.creditCard;
    final isGift = this.isGift;

    if (isCredit) {
      if (isGift) {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          _creditCardWithGift();
          toastMessage(
            message: AppStrings.giftOrderPlacedSuccessfullyAsGift,
            tybeMessage: TybeMessage.positive,
          );
        } else {
          toastMessage(
            message: AppStrings.pleaseCompleteTheGiftFormCorrectly,
            tybeMessage: TybeMessage.negative,
          );
        }
      } else {
        _creditCard();
        toastMessage(
          message: AppStrings.creditCardSelectedNonGift,
          tybeMessage: TybeMessage.positive,
        );
      }
    } else {
      _cashOnDelivery();
    }
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

  _cashOnDelivery() async {
    emit(CashOnDeliveryLoadingState());
    final result = await cacheUsecase.call(
        lat: selectedAddress?.lat ?? "",
        long: selectedAddress?.long ?? "",
        street: selectedAddress?.street ?? "",
        city: selectedAddress?.city ?? "",
        phone: selectedAddress?.phone ?? "");
    switch (result) {
      case SuccessApiResult():
        emit(CashOnDeliverySuccessState());
        break;
      case ErrorApiResult():
        print("${result.exception.toString()} Error ⛔⛔");
        emit(CashOnDeliveryErrorState(message: result.exception.toString()));
        break;
    }
  }

  _creditCard() async {
    emit(CreditCardLoadingState());
    final result = await creditCardUsecase.call(
        lat: selectedAddress?.lat ?? "",
        long: selectedAddress?.long ?? "",
        street: selectedAddress?.street ?? "",
        city: selectedAddress?.city ?? "",
        phone: selectedAddress?.phone ?? "");
    switch (result) {
      case SuccessApiResult():
        emit(CreditCardSuccessState(url: result.data?.session?.url ?? ""));
        break;
      case ErrorApiResult():
        print("${result.exception.toString()} Error ⛔⛔");
        emit(CreditCardErrorState(message: result.exception.toString()));
        break;
    }
  }

  _creditCardWithGift() async {
    emit(CreditCardLoadingState());
    final result = await creditCardUsecase.call(
        // add gift here
        lat: selectedAddress?.lat ?? "",
        long: selectedAddress?.long ?? "",
        street: selectedAddress?.street ?? "",
        city: selectedAddress?.city ?? "",
        phone: selectedAddress?.phone ?? "");
    switch (result) {
      case SuccessApiResult():
        emit(CreditCardSuccessState(url: result.data?.session?.url ?? ""));
        break;
      case ErrorApiResult():
        print("${result.exception.toString()} Error ⛔⛔");
        emit(CreditCardErrorState(message: result.exception.toString()));
        break;
    }
  }

  _launchPaymentUrl(String? url, BuildContext context) {
    if (url == null || url.isEmpty) return;
    try {
      final uri = Uri.tryParse(url);
      if (uri != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PaymentWebView(url: url),
          ),
        );
      }
    } catch (e) {
      toastMessage(
        message: "Failed to open payment page",
        tybeMessage: TybeMessage.negative,
      );
    }
  }
}
