import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/categories_entity/all_categories_entity/categories_entity.dart';
import 'package:flora_mart/domain/repo_contract/categories_repo.dart';
import 'package:flora_mart/domain/usecase/categories_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'categories_usecase_test.mocks.dart';

@GenerateMocks([CategoriesRepo])
void main() {
  late CategoriesUsecase categoriesUsecase;
  late MockCategoriesRepo mockCategoriesRepo;

  setUp(() {
    mockCategoriesRepo = MockCategoriesRepo();
    categoriesUsecase = CategoriesUsecase(mockCategoriesRepo);
  });

  const String testId = '123';
  const String testName = 'Electronics';
  const num testProductsCount = 10;

  final categories = [CategoriesEntity(id: '1', name: 'Category 1', productsCount: 8)];

  provideDummy<ApiResult<List<CategoriesEntity>>>(SuccessApiResult(categories));

  test('should return SuccessApiResult when categories are fetched successfully for tabs', () async {
    when(mockCategoriesRepo.getAllCategories(
      id: testId,
      name: testName,
      productsCount: testProductsCount,
    )).thenAnswer((_) async => SuccessApiResult(categories));

    final result = await categoriesUsecase.call(
      id: testId,
      name: testName,
      productsCount: testProductsCount,
    );

    expect(result, isA<SuccessApiResult<List<CategoriesEntity>>>());
    expect((result as SuccessApiResult).data, equals(categories));
    verify(mockCategoriesRepo.getAllCategories(
      id: testId,
      name: testName,
      productsCount: testProductsCount,
    )).called(1);
    verifyNoMoreInteractions(mockCategoriesRepo);
  });

  test('should return ErrorApiResult when categories fetching fails for tabs', () async {
    final error = Exception('Failed to fetch categories');
    when(mockCategoriesRepo.getAllCategories(
      id: testId,
      name: testName,
      productsCount: testProductsCount,
    )).thenAnswer((_) async => ErrorApiResult(error));

    final result = await categoriesUsecase.call(
      id: testId,
      name: testName,
      productsCount: testProductsCount,
    );

    expect(result, isA<ErrorApiResult<List<CategoriesEntity>>>());
    expect((result as ErrorApiResult).exception.toString(), contains('Failed to fetch categories'));
    verify(mockCategoriesRepo.getAllCategories(
      id: testId,
      name: testName,
      productsCount: testProductsCount,
    )).called(1);
    verifyNoMoreInteractions(mockCategoriesRepo);
  });

  test('should return ErrorApiResult when an exception occurs for tabs', () async {
    when(mockCategoriesRepo.getAllCategories(
      id: testId,
      name: testName,
      productsCount: testProductsCount,
    )).thenThrow(Exception('Unexpected error'));

    final result = await categoriesUsecase.call(
      id: testId,
      name: testName,
      productsCount: testProductsCount,
    );

    expect(result, isA<ErrorApiResult<List<CategoriesEntity>>>());
    expect((result as ErrorApiResult).exception.toString(), contains('Unexpected error'));
    verify(mockCategoriesRepo.getAllCategories(
      id: testId,
      name: testName,
      productsCount: testProductsCount,
    )).called(1);
    verifyNoMoreInteractions(mockCategoriesRepo);
  });
}
