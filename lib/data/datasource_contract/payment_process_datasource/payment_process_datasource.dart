import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/payment/cash/cash_payment_response.dart';
import 'package:flora_mart/data/model/payment/credit_card/Credit_card_payment_response.dart';

abstract class PaymentProcessDataSource {
  Future<ApiResult<CashPaymentResponse>> cashPayment(
      {required String lat,
      required String long,
      required String street,
      required String city,
      required String phone});
  Future<ApiResult<CreditCardPaymentResponse>> creditCardPayment(
      {required String lat,
      required String long,
      required String street,
      required String city,
      required String phone});
}
