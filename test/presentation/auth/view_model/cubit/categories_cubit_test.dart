import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flora_mart/domain/usecase/categories_usecase.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/categories_cubit.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/categories_intent.dart';
import 'package:flora_mart/domain/entity/categories_entity/all_categories_entity/categories_entity.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'categories_cubit_test.mocks.dart';

@GenerateMocks([CategoriesUsecase])
void main() {
  group('CategoriesCubit', () {
    late MockCategoriesUsecase mockCategoriesUsecase;
    late CategoriesCubit categoriesCubit;

    final sampleCategory =
        CategoriesEntity(id: '1', name: 'Test Category', productsCount: 10);

    setUp(() {
      mockCategoriesUsecase = MockCategoriesUsecase();
      categoriesCubit = CategoriesCubit(mockCategoriesUsecase);
    });

    blocTest<CategoriesCubit, CategoriesState>(
      'emits [CategoriesLoading, CategoriesSuccess] when data is loaded successfully for tabs',
      build: () {
        provideDummy<ApiResult<List<CategoriesEntity>>>(
            SuccessApiResult([sampleCategory]));

        when(mockCategoriesUsecase.call(
          id: '123',
          name: 'Electronics',
          productsCount: 10,
        )).thenAnswer((_) async => SuccessApiResult([sampleCategory]));

        return categoriesCubit;
      },
      act: (cubit) => cubit.handleIntent(
        AllCategoriesIntent(id: '123', name: 'Electronics', productsCount: 10),
      ),
      expect: () => [
        isA<CategoriesLoading>(),
        isA<CategoriesSuccess>(),
      ],
    );

    blocTest<CategoriesCubit, CategoriesState>(
      'emits [CategoriesFailure] when input is invalid for tabs',
      build: () => categoriesCubit,
      act: (cubit) => cubit.handleIntent(
        AllCategoriesIntent(id: '', name: '', productsCount: 0),
      ),
      expect: () => [
        isA<CategoriesFailure>().having(
          (e) => e.message,
          'message',
          contains('Invalid input'),
        ),
      ],
    );

  });
}
