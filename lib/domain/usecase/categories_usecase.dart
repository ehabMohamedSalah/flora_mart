import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/categories_entity/all_categories_entity/categories_entity.dart';
import 'package:flora_mart/domain/repo_contract/categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesUsecase {
  final CategoriesRepo categoriesRepo;

  CategoriesUsecase(this.categoriesRepo);

  Future<ApiResult<List<CategoriesEntity>>> call({
    required String id,
    required String name,
    required num productsCount,
  }) async {
    try {
      print(
          "📌 [UseCase] Fetching categories with: id=$id, name=$name,productsCount=$productsCount");
      var result = await categoriesRepo.getAllCategories(
          id: id, name: name, productsCount: productsCount);
      if (result is SuccessApiResult<List<CategoriesEntity>>) {
        print("✅ [UseCase] Categories Retrieved Successfully: ${result.data}");
      } else if (result is ErrorApiResult<List<CategoriesEntity>>) {
        print("❌ [UseCase] Error: ${result.exception}");
      }
      return result;
    } catch (e, stacktrace) {
      print("🔥 [UseCase] Exception Occurred: $e");
      print("📝 [UseCase] Stacktrace: $stacktrace");
      return ErrorApiResult(Exception("Unexpected error in CategoriesUsecase"));
    }
  }
}
