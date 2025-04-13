
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../../data/model/products/Products.dart';
import '../../../../../../domain/entity/occassions_entity/OccasionsResponse.dart';

@immutable
sealed class OccasionsState {}

final class OccasionsInitial extends OccasionsState {}




/// Home Occasion States ///
final class GetOccasionInitial extends OccasionsState {}

final class GetOccasionLoading extends OccasionsState {}

final class GetOccasionSuccess extends OccasionsState {
  OccasiosnResponseEntity? occasions;
  GetOccasionSuccess({required this.occasions});
}

final class GetOccasionError extends OccasionsState {
  final String message;

  GetOccasionError({required this.message});
}

final class GetProductsLoading extends OccasionsState{}
final class GetProductsSuccess extends OccasionsState{
   List<Products> products;
   GetProductsSuccess(this.products);
}
final class GetProductsError extends OccasionsState{
  final String messsage;
  GetProductsError(this.messsage);
}