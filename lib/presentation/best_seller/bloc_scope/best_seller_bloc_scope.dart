import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/presentation/best_seller/view_model/cubit/best_seller_cubit.dart';

class BestSellerBlocScope extends StatelessWidget {
  final Widget child;

  const BestSellerBlocScope({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BestSellerCubit>(),
      child: child,
    );
  }
}