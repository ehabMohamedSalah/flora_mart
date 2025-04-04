import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/occasion_datasource/occasions_datasource.dart';

import 'package:flora_mart/domain/entity/occassions_entity/OccasionsResponse.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo_contract/occasions_repo.dart';
@Injectable(as: OccasionsRepo)
class OcassionsRepoImpl extends OccasionsRepo{
  OccassionsDataSource apiDatasource;
  OcassionsRepoImpl(this.apiDatasource);
  @override
  Future<ApiResult<OccasiosnResponseEntity>> getOccasions()  {
    return apiDatasource.getOccasions();
  }

}
