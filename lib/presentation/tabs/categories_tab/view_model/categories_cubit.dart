import 'package:bloc/bloc.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/usecase/categories_usecase.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/categories_intent.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:flora_mart/domain/entity/categories_entity/all_categories_entity/categories_entity.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesUsecase categoriesUsecase;

  CategoriesCubit(this.categoriesUsecase) : super(CategoriesInitial());

  Future<void> handleIntent(CategoriesIntent intent) async {
    if (intent is AllCategoriesIntent) {
      print(
          "🟢 [Cubit] Received Intent: id=${intent.id}, name=${intent.name},productsCount=${intent.productsCount}");

      if (intent.id.isEmpty || intent.name.isEmpty) {
        print(
            "⚠️ [Cubit] Invalid input: id=${intent.id}, name=${intent.name},productsCount=${intent.productsCount}");
        emit(CategoriesFailure(
            "Invalid input: Please provide valid id, name, and productsCount"));
        return;
      }

      emit(CategoriesLoading());

      try {
        final result = await categoriesUsecase.call(
            id: intent.id,
            name: intent.name,
            productsCount: intent.productsCount);

        if (result is SuccessApiResult<List<CategoriesEntity>>) {
          print("✅ [Cubit] Categories Loaded Successfully: ${result.data}");
          emit(CategoriesSuccess(result.data!));
        } else if (result is ErrorApiResult<List<CategoriesEntity>>) {
          print("❌ [Cubit] API Error: ${result.exception}");
          emit(CategoriesFailure(result.exception.toString()));
        }
      } catch (e) {
        print("🔥 [Cubit] Exception occurred: ${e.toString()}");
        emit(CategoriesFailure("An exception occurred: ${e.toString()}"));
      }
    }
  }
}
