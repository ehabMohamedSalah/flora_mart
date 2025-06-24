import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/order_response/OrderResponse.dart';
import 'package:flora_mart/domain/repo_contract/order_repo.dart';
import 'package:flora_mart/domain/usecase/order_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'order_usecase_test.mocks.dart';

@GenerateMocks([OrderRepo])
void main() {
  group("usecase test", (){
    late OrderUsecase orderUsecase;
    late OrderRepo repo;
    setUp((){
      repo =MockOrderRepo();
      orderUsecase=OrderUsecase(repo);
    },);

    test('when call invoke from usecase it should'
        ' call gerOrders from repo', ()async {
      //arrange
      var result =SuccessApiResult<OrderResponse>(null);
      provideDummy<ApiResult<OrderResponse>>(result);
      when(repo.getOrder()).thenAnswer((_)async=>result);

      // act
      var actual= await orderUsecase.call();
      // function behavior is correct

      // assert , verifications, expectations
      verify(repo.getOrder()).called(1); // call verification
      expect(actual, equals(result));
    });
  });



}