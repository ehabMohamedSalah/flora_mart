import 'package:dio/dio.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_impl/Payment_process_datasource_impl/payment_process_datasource_impl.dart';
import 'package:flora_mart/data/model/payment/cash/cash_payment_response.dart';
import 'package:flora_mart/data/model/payment/credit_card/Credit_card_payment_response.dart';
import 'package:flora_mart/data/model/payment/credit_card/Session.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_process_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager, CacheHelper])
void main() {
  late MockApiManager mockApiManager;
  late MockCacheHelper mockCacheHelper;
  late PaymentProcessDataSourceImpl datasource;

  setUp(() {
    mockApiManager = MockApiManager();
    mockCacheHelper = MockCacheHelper();
    datasource = PaymentProcessDataSourceImpl(mockApiManager, mockCacheHelper);
  });
  const token = "test_token";
  const fakeLat = "30.0";
  const fakeLong = "31.0";
  const fakeStreet = "Test Street";
  const fakeCity = "Test City";
  const fakePhone = "01000000000";

  CashPaymentResponse cashResponseData =
      CashPaymentResponse(message: "Success");

  CreditCardPaymentResponse creditResponseData = CreditCardPaymentResponse(
      message: "Success",
      session: Session(
        url: "https://test.com",
      ));

  group("PaymentProcessDataSourceImpl tests", () {
    test("cashPayment returns CashPaymentResponse on success", () async {
      // final result = SuccessApiResult<CashPaymentResponse>(cashResponseData);
      when(mockCacheHelper.getData<String>(Constant.tokenKey))
          .thenAnswer((_) async => token);
      // provideDummy<ApiResult>(result);

      when(mockApiManager.postRequest(
        endpoint: anyNamed('endpoint'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => Response(
          data: cashResponseData.toJson(),
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final actual = await datasource.cashPayment(
          lat: fakeLat,
          long: fakeLong,
          street: fakeStreet,
          city: fakeCity,
          phone: fakePhone);

      // verify(datasource.cashPayment(
      //   lat: fakeLat,
      //   long: fakeLong,
      //   street: fakeStreet,
      //   city: fakeCity,
      //   phone: fakePhone,
      // )).called(1);
      expect(actual, isA<SuccessApiResult<CashPaymentResponse>>());
      expect((actual as SuccessApiResult<CashPaymentResponse>).data?.message,
          "Success");
    });

    test("creditCardPayment returns CreditCardPaymentResponse on success",
        () async {
      when(mockCacheHelper.getData<String>(Constant.tokenKey))
          .thenAnswer((_) async => token);

      when(mockApiManager.postRequest(
        endpoint: anyNamed('endpoint'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => Response(
            data: creditResponseData.toJson(),
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      final actual = await datasource.creditCardPayment(
        lat: fakeLat,
        long: fakeLong,
        street: fakeStreet,
        city: fakeCity,
        phone: fakePhone,
      );

      expect(actual, isA<SuccessApiResult<CreditCardPaymentResponse>>());
      expect(
          (actual as SuccessApiResult<CreditCardPaymentResponse>).data?.message,
          "Success");

      expect(
          (actual).data?.session?.url, equals(creditResponseData.session?.url));
    });
  });
}
