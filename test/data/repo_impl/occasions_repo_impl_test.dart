
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/occasion_datasource/occasions_datasource.dart';
import 'package:flora_mart/data/datasource_impl/occasions_datasource_impl/occassions_datasource_impl.dart';
import 'package:flora_mart/data/model/occasions/Metadata.dart';
import 'package:flora_mart/data/repo_impl/occasions_repo_impl.dart';
import 'package:flora_mart/domain/entity/occassions_entity/OccasionsResponse.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasions_repo_impl_test.mocks.dart';


@GenerateMocks([OccassionsDataSource])
void main() {
  group("Occasions Repo", () {
    late OcassionsRepoImpl ocassionsRepoImpl ;
    late OccassionsDataSource dataSource;
    setUp(() {
      dataSource = MockOccassionsDataSource();
      ocassionsRepoImpl = OcassionsRepoImpl(dataSource);
    },);

    test('when getOccasions then'
        'it should call getCategories from datasource', ()async{
      var result =SuccessApiResult<OccasiosnResponseEntity>(
          OccasiosnResponseEntity(
            message: 'success',
            metadata: Metadata(currentPage: 1, limit: 10, totalPages: 2, totalItems: 15),
            occasions: [],
          ));

      provideDummy<ApiResult<OccasiosnResponseEntity>>(result );

      when(dataSource.getOccasions()).thenAnswer((_)async=>result);

      var actual = await ocassionsRepoImpl.getOccasions();

      verify(dataSource.getOccasions()).called(1);
      expect(actual, equals(result));
    });

  },);
}