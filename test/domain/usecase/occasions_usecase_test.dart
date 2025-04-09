import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/occassions_entity/OccasionsResponse.dart';
import 'package:flora_mart/domain/repo_contract/occasions_repo.dart';
import 'package:flora_mart/domain/usecase/occasions_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasions_usecase_test.mocks.dart';

@GenerateMocks([OccasionsRepo])
void main() {
  group("usecase test", (){
    late OccassionsUsecase occassionsUsecase;
    late OccasionsRepo repo;
    setUp((){
      repo =MockOccasionsRepo();
      occassionsUsecase=OccassionsUsecase(repo);
    },);

    test('when call invoke from usecase it should'
        ' call getOccasion from repo', ()async {
        //arrange
         var result =SuccessApiResult<OccasiosnResponseEntity>(null);
      provideDummy<ApiResult<OccasiosnResponseEntity>>(result);
      when(repo.getOccasions()).thenAnswer((_)async=>result);

      // act
      var actual= await occassionsUsecase.invoke();
      // function behavior is correct

      // assert , verifications, expectations
      verify(repo.getOccasions()).called(1); // call verification
      expect(actual, equals(result));
    });
  });



}