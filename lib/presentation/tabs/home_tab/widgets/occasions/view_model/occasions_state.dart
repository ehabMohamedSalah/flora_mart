
import 'package:flutter/material.dart';

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