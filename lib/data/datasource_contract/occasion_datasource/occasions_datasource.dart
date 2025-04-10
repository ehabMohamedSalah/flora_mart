import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/occassions_entity/OccasionsResponse.dart';

abstract class OccassionsDataSource{
  Future<ApiResult<OccasiosnResponseEntity>> getOccasions();
}