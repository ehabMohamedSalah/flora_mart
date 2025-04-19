// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/payment/credit_card/Credit_card_payment_response.dart';
import 'package:flora_mart/domain/repo_contract/Payment_process_repo/payment_process_repo.dart';
import 'package:flora_mart/domain/usecase/Payment_process_uesecases/credit_card_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cash_usecase_test.mocks.dart';

@GenerateMocks([PaymentProcessRepo])
void main() {
  group('CreditCardUsecase', () {
    late CreditCardUsecase usecase;
    late MockPaymentProcessRepo mockRepo;

    setUp(() {
      mockRepo = MockPaymentProcessRepo();
      usecase = CreditCardUsecase(mockRepo);
    });

    test(
        'when calling call() should invoke creditCardPayment from PaymentProcessRepo with correct arguments',
        () async {
      const lat = '30.0';
      const long = '31.0';
      const street = 'Main St';
      const city = 'Cairo';
      const phone = '01012345678';

      final result = SuccessApiResult(
        CreditCardPaymentResponse(message: 'Payment successful'),
      );

      provideDummy<ApiResult<CreditCardPaymentResponse>>(result);

      when(mockRepo.creditCardPayment(
        lat: lat,
        long: long,
        street: street,
        city: city,
        phone: phone,
      )).thenAnswer((_) async => result);

      final actual = await usecase.call(
        lat: lat,
        long: long,
        street: street,
        city: city,
        phone: phone,
      );

      expect(actual, equals(result));
      verify(mockRepo.creditCardPayment(
        lat: lat,
        long: long,
        street: street,
        city: city,
        phone: phone,
      )).called(1);
    });
  });
}
