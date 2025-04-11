// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/forget_password_screen.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/reset_password_screen.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/verify_reset_code_screen.dart';
import 'package:flora_mart/presentation/auth/login/login_screen.dart';
import 'package:flora_mart/presentation/auth/register/view/register_screen.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view/occasion_widget.dart';
import 'package:flora_mart/presentation/tabs/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/theme/app_theme.dart';
import 'core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    String initialRoute() {
      bool? rememberMe = CacheHelper.getRememberMe();
      print("$rememberMe ⭐⭐⭐⭐⭐⭐⭐⭐");
      return rememberMe == true
          ? RouteManager.mainScreen
          : RouteManager.loginScreen;
    }

    return ScreenUtilInit(
      designSize: const Size(375, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          // routes: {
          //   RouteManager.homeScreen: (context) => HomeScreen(),
          //   RouteManager.cartScreen: (context) => CartScreen(),
          //   RouteManager.profileScreen: (context) => ProfileScreen(),
          //   RouteManager.categoriesScreen: (context) => CategoriesScreen(),
          // },

          routes: {
            RouteManager.mainScreen: (context) => MainScreen(),
            RouteManager.occasionScreen: (context) => const OccasionScreen(),
            RouteManager.loginScreen: (context) => const SignInScreen(),
            RouteManager.registerScreen: (context) => const RegisterScreen(),
            RouteManager.forgetPasswordScreen: (context) =>
                const ForgetPasswordScreen(),
            RouteManager.emailVerificationScreen: (context) =>
                const VerifyResetCodeScreen(),
            RouteManager.resetPasswordScreen: (context) =>
                const ResetPasswordScreen(),
          },

          theme: AppTheme.lightTheme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: initialRoute(),
        );
      },
    );
  }
}
