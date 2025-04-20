import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/payment_process_datasource/payment_process_datasource.dart';
import 'package:flora_mart/data/model/payment/cash/cash_payment_response.dart';
import 'package:flora_mart/data/model/payment/credit_card/Credit_card_payment_response.dart';
import 'package:flora_mart/data/repo_impl/payment_process_repo_impl/payment_process_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_process_repo_impl_test.mocks.dart';

@GenerateMocks([PaymentProcessDataSource])
void main() {
  group('PaymentProcessRepoImpl', () {
    late PaymentProcessRepoImpl repo;
    late MockPaymentProcessDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockPaymentProcessDataSource();
      repo = PaymentProcessRepoImpl(mockDataSource);
    });

    const lat = "30.0";
    const long = "31.0";
    const street = "Test Street";
    const city = "Test City";
    const phone = "01000000000";

    test('cashPayment should call cashPayment in datasource', () async {
      final result = SuccessApiResult<CashPaymentResponse>(
        CashPaymentResponse(message: 'تم الدفع نقدًا'),
      );
      provideDummy<ApiResult<CashPaymentResponse>>(result);

      when(mockDataSource.cashPayment(
        lat: lat,
        long: long,
        street: street,
        city: city,
        phone: phone,
      )).thenAnswer((_) async => result);

      final actual = await repo.cashPayment(
        lat: lat,
        long: long,
        street: street,
        city: city,
        phone: phone,
      );

      expect(actual, equals(result));
      verify(mockDataSource.cashPayment(
        lat: lat,
        long: long,
        street: street,
        city: city,
        phone: phone,
      )).called(1);
    });

    test('creditCardPayment should call creditCardPayment in datasource',
        () async {
      final result = SuccessApiResult<CreditCardPaymentResponse>(
        CreditCardPaymentResponse(message: 'تم الدفع بالبطاقة'),
      );
      provideDummy<ApiResult<CreditCardPaymentResponse>>(result);

      when(mockDataSource.creditCardPayment(
        lat: lat,
        long: long,
        street: street,
        city: city,
        phone: phone,
      )).thenAnswer((_) async => result);

      final actual = await repo.creditCardPayment(
        lat: lat,
        long: long,
        street: street,
        city: city,
        phone: phone,
      );

      expect(actual, equals(result));
      verify(mockDataSource.creditCardPayment(
        lat: lat,
        long: long,
        street: street,
        city: city,
        phone: phone,
      )).called(1);
    });
  });
}
