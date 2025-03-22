import 'package:easy_localization/easy_localization.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flutter/material.dart';

import 'core/api/api_manager.dart';
import 'core/di/di.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  ApiManager.init();
  await CacheHelper.init();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      startLocale: Locale("en"),
      child: MyApp()));
}
