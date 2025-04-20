import 'package:flora_mart/core/api/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/products/Products.dart';
import '../repo_contract/search_repo.dart';

@injectable
class SearchUsecase {
  final SearchRepo searchRepo;

  SearchUsecase(this.searchRepo);

  Future<ApiResult<List<Products>>> execute(String searchQuery) =>
      searchRepo.getAllProductsBasedOnSearchQuery(searchQuery);
}

