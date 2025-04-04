import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/occasion_datasource/occasions_datasource.dart';
import 'package:flora_mart/domain/entity/occassions_entity/OccasionsResponse.dart';
 import 'package:injectable/injectable.dart';
import '../../../core/api/endpoints.dart';
import '../../../domain/common/result.dart';
 import '../../model/occasions/OccasiosnResponse.dart';

@Injectable(as:OccassionsDataSource )
class OccasionsDatasourceImpl extends OccassionsDataSource{
  ApiManager apiManager;
  OccasionsDatasourceImpl(this.apiManager);
  @override
  Future<ApiResult<OccasiosnResponseEntity>> getOccasions()async {
try{
  var response=  await apiManager.getRequest(Endpoint: EndPoint.occassionsEndpoint);
  OccasiosnResponse occasionsModel=OccasiosnResponse.fromJson(response.data);
  OccasiosnResponseEntity occasionsEntity=occasionsModel.toOccasiosnResponseEntity();
  return SuccessApiResult (occasionsEntity);

}catch (err) {
  return ErrorApiResult(
      Exception("Server connection error: ${err.toString()}"));
}
  }

}