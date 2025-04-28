import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flora_mart/core/observer/bloc_observer.dart';
import 'package:flora_mart/firebase_options.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api/api_manager.dart';
import 'core/di/di.dart';
import 'my_app.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(!kDebugMode);
    FirebaseCrashlytics.instance.log("App started");
    FirebaseCrashlytics.instance.setUserIdentifier("12345");
    FirebaseCrashlytics.instance.setCustomKey("user_email", "user@example.com");

    await EasyLocalization.ensureInitialized();
    configureDependencies();
    Bloc.observer = MyBlocObserver();
    ApiManager.init();

    final authCubit = getIt<AuthCubit>()..doIntent(CheckAuthIntent());

    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('en'),
        child: BlocProvider<AuthCubit>(
          create: (context) => authCubit,
          child: const MyApp(),
        ),
      ),
    );
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}
