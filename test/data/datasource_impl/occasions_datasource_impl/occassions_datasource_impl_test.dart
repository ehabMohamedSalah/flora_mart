import 'package:dio/dio.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/data/datasource_contract/occasion_datasource/occasions_datasource.dart';
import 'package:flora_mart/data/datasource_impl/occasions_datasource_impl/occassions_datasource_impl.dart';
import 'package:flora_mart/domain/entity/occassions_entity/OccasionsResponse.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../Login_Data_Source_Repo_Impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  group('occasions Datasource', (){
    late OccassionsDataSource dataSource;
    late ApiManager apiManager;

    setUp((){
      apiManager=MockApiManager();
      dataSource=OccasionsDatasourceImpl(apiManager);
    });
    test('when calling getOccasions it should return list of occasions', () async {
      // Arrange
      final mockResponse = Response(
        data: {
          "message": "aa",
          "metadata": {
            "currentPage": 1,
            "totalPages": 1,
            "limit": 2,
            "totalItems": 2
          },
          "occasions": [
            {
              "id": "1",
              "createdAt": "",
              "image": "ss",
              "name": "ehab",
              "productsCount": 2,
              "slug": "",
              "updatedAt": ""
            },
            {
              "id": "2",
              "createdAt": "",
              "image": "ss",
              "name": "ahmed",
              "productsCount": 3,
              "slug": "",
              "updatedAt": ""
            },
            {
              "id": "3",
              "createdAt": "",
              "image": "ss",
              "name": "mohamed",
              "productsCount": 5,
              "slug": "",
              "updatedAt": ""
            }
          ]
        },
        requestOptions: RequestOptions(path: EndPoint.occassionsEndpoint), // تأكد من وضع الـ endpoint هنا
      );
      when(apiManager.getRequest(Endpoint: EndPoint.occassionsEndpoint))
          .thenAnswer((_) async => mockResponse);

      var actual = await dataSource.getOccasions() ;

      verify(apiManager.getRequest(Endpoint: EndPoint.occassionsEndpoint)).called(1);
      expect(actual, isA<SuccessApiResult<OccasiosnResponseEntity>>()); // التأكد من النوع الصحيح

    });

  });

}