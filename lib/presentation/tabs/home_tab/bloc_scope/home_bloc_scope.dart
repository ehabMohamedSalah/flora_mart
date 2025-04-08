import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_cubit.dart';

class HomeBlocScope extends StatelessWidget {
  final Widget child;

  const HomeBlocScope({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: child,
    );
  }
}
