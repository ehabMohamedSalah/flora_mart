import 'package:easy_localization/easy_localization.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/forget_password_screen.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/reset_password_screen.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/verify_reset_code_screen.dart';
import 'package:flora_mart/presentation/auth/login/login_screen.dart';
import 'package:flora_mart/presentation/auth/register/view/register_screen.dart';
import 'package:flora_mart/presentation/tabs/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/theme/app_theme.dart';
import 'core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
      designSize: Size(375, 852),
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
            RouteManager.loginScreen: (context) => SignInScreen(),
            RouteManager.registerScreen: (context) => RegisterScreen(),
            RouteManager.forgetPasswordScreen: (context) =>
                ForgetPasswordScreen(),
            RouteManager.emailVerificationScreen: (context) =>
                VerifyResetCodeScreen(),
            RouteManager.resetPasswordScreen: (context) =>
                ResetPasswordScreen(),
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
