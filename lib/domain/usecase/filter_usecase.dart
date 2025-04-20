import 'package:flora_mart/core/api/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/products/Products.dart';
import '../repo_contract/filter_repo.dart';

@injectable
class FilterUsecase {
  final FilterRepo filterRepo;

  FilterUsecase(this.filterRepo);

  Future<ApiResult<List<Products>>> execute(String filter) =>
      filterRepo.getAllProductsBasedOnFilter(filter);
}

