import 'package:flora_mart/core/api/api_excuter.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_contract/payment_process_datasource/payment_process_datasource.dart';
import 'package:flora_mart/data/model/payment/cash/cash_payment_response.dart';
import 'package:flora_mart/data/model/payment/credit_card/Credit_card_payment_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentProcessDataSource)
class PaymentProcessDataSourceImpl implements PaymentProcessDataSource {
  final ApiManager apiManager;
  final CacheHelper cacheHelper;
  @factoryMethod
  PaymentProcessDataSourceImpl(this.apiManager, this.cacheHelper);
  @override
  Future<ApiResult<CashPaymentResponse>> cashPayment(
      {required String lat,
      required String long,
      required String street,
      required String city,
      required String phone}) {
    return executeApi(() async {
      String token = await cacheHelper.getData<String>(Constant.tokenKey);

      var apiResult = await apiManager.postRequest(
        endpoint: EndPoint.cashPaymentEndpoint,
        body: {
          "shippingAddress": {
            "street": street,
            "phone": phone,
            "city": city,
            "lat": lat,
            "long": long
          }
        },
        headers: {"Authorization": "Bearer $token"},
      );
      var result = CashPaymentResponse.fromJson(apiResult.data ?? {});

      return result;
    });
  }

  @override
  Future<ApiResult<CreditCardPaymentResponse>> creditCardPayment(
      {required String lat,
      required String long,
      required String street,
      required String city,
      required String phone}) {
    return executeApi(() async {
      String token = await cacheHelper.getData<String>(Constant.tokenKey);

      var apiResult = await apiManager.postRequest(
        endpoint: EndPoint.creditCardPaymentEndpoint,
        body: {
          "shippingAddress": {
            "street": street,
            "phone": phone,
            "city": city,
            "lat": lat,
            "long": long
          }
        },
        headers: {"Authorization": "Bearer $token"},
      );
      var result = CreditCardPaymentResponse.fromJson(apiResult.data ?? {});

      return result;
    });
  }
}
