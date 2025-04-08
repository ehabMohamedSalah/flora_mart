part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoriesEntity> categories;

  CategoriesSuccess(this.categories);
}

class CategoriesFailure extends CategoriesState {
  final String message;

  CategoriesFailure(this.message);
}
