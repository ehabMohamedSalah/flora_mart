import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flora_mart/core/observer/bloc_observer.dart';
import 'package:flora_mart/firebase_options.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api/api_manager.dart';
import 'core/di/di.dart';
import 'my_app.dart';
import 'dart:async'; // For runZonedGuarded

void main() async {
  // Ensure Flutter binding is initialized before interacting with the framework
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, // Make sure you have the Firebase options correctly configured
    );

    // Set up Crashlytics to capture Flutter errors
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    // Optionally log custom messages to Crashlytics
    FirebaseCrashlytics.instance.log("App started");

    // Example of setting a user ID for crash reports
    FirebaseCrashlytics.instance.setUserIdentifier("12345");

    // You can set more details to identify the user in Crashlytics logs:
    FirebaseCrashlytics.instance.setCustomKey("user_email", "user@example.com");

    // Initialize EasyLocalization for multi-language support
    await EasyLocalization.ensureInitialized();

    // Configure Dependency Injection (DI)
    configureDependencies();

    // Set up custom BLoC observer for logging state transitions
    Bloc.observer = MyBlocObserver();

    // Initialize the API manager
    ApiManager.init();

    // Create an instance of the AuthCubit and trigger the CheckAuthIntent
    final authCubit = getIt<AuthCubit>()..doIntent(CheckAuthIntent());

    // Run the app with EasyLocalization and BLoC
    runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations', // Path to translation files
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: BlocProvider<AuthCubit>(
        create: (context) => authCubit,
        child: const MyApp(), // Your main app widget
      ),
    ));
  }, (error, stack) {
    // Handle uncaught errors by sending them to Firebase Crashlytics
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
