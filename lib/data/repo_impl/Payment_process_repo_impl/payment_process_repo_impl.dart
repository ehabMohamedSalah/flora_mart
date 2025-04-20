import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/payment_process_datasource/payment_process_datasource.dart';
import 'package:flora_mart/data/model/payment/cash/cash_payment_response.dart';
import 'package:flora_mart/data/model/payment/credit_card/Credit_card_payment_response.dart';
import 'package:flora_mart/domain/repo_contract/Payment_process_repo/payment_process_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentProcessRepo)
class PaymentProcessRepoImpl implements PaymentProcessRepo {
  final PaymentProcessDataSource paymentProcessDataSource;
  @factoryMethod
  PaymentProcessRepoImpl(this.paymentProcessDataSource);
  @override
  Future<ApiResult<CashPaymentResponse>> cashPayment(
      {required String lat,
      required String long,
      required String street,
      required String city,
      required String phone}) {
    return paymentProcessDataSource.cashPayment(
        lat: lat, long: long, street: street, city: city, phone: phone);
  }

  @override
  Future<ApiResult<CreditCardPaymentResponse>> creditCardPayment(
      {required String lat,
      required String long,
      required String street,
      required String city,
      required String phone}) {
    return paymentProcessDataSource.creditCardPayment(
        lat: lat, long: long, street: street, city: city, phone: phone);
  }
}
