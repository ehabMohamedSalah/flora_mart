import 'package:easy_localization/easy_localization.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:flora_mart/core/observer/bloc_observer.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/api/api_manager.dart';
import 'core/di/di.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  ApiManager.init();

  final authCubit = getIt<AuthCubit>()..doIntent(CheckAuthIntent());
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    // <-- change the path of the translation files
    fallbackLocale: const Locale('en'),
    startLocale: const Locale("en"),
    child: BlocProvider<AuthCubit>(
      create: (context) => authCubit,
      child: const MyApp(),
    ),
  ));
}
