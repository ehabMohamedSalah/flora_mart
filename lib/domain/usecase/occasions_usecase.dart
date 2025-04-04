
import 'package:flora_mart/domain/repo_contract/occasions_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../entity/occassions_entity/OccasionsResponse.dart';

@injectable
class OccassionsUsecase{
  OccasionsRepo occasionsRepo;
  OccassionsUsecase(this.occasionsRepo);

  Future<ApiResult<OccasiosnResponseEntity>> invoke(){
    return occasionsRepo.getOccasions();
  }

}
