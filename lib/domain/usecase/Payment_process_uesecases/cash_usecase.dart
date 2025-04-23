import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/payment/cash/cash_payment_response.dart';
import 'package:flora_mart/domain/repo_contract/Payment_process_repo/payment_process_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CacheUsecase {
  final PaymentProcessRepo paymentProcessRepo;

  @factoryMethod
  CacheUsecase(this.paymentProcessRepo);

  Future<ApiResult<CashPaymentResponse>> call(
      {required String lat,
      required String long,
      required String street,
      required String city,
      required String phone}) {
    return paymentProcessRepo.cashPayment(
        lat: lat, long: long, street: street, city: city, phone: phone);
  }
}
