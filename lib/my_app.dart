// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/domain/entity/auth/user_entity.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/forget_password_screen.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/reset_password_screen.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/verify_reset_code_screen.dart';
import 'package:flora_mart/presentation/auth/login/login_screen.dart';
import 'package:flora_mart/presentation/auth/register/view/register_screen.dart';
import 'package:flora_mart/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:flora_mart/presentation/edit_profile_screen/view_model/edit_profile_cubit.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view/occasion_widget.dart';
import 'package:flora_mart/presentation/tabs/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/theme/app_theme.dart';
import 'core/utils/routes_manager.dart';
import 'presentation/check_out/view/check_out_page.dart';
import 'presentation/reset_password/change_password_page.dart';

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
            RouteManager.changePasswordScreen: (context) =>
                const ResetPasswordPage(),
            RouteManager.occasionScreen: (context) => const OccasionScreen(),
            RouteManager.loginScreen: (context) => const SignInScreen(),
            RouteManager.registerScreen: (context) => const RegisterScreen(),
            RouteManager.forgetPasswordScreen: (context) =>
                const ForgetPasswordScreen(),
            RouteManager.emailVerificationScreen: (context) =>
                const VerifyResetCodeScreen(),
            RouteManager.resetPasswordScreen: (context) =>
                const ResetPasswordScreen(),
            RouteManager.editProfileScreen: (context) => BlocProvider(
                  create: (context) => getIt<EditProfileCubit>(),
                  child: EditProfileScreen(
                    user: ModalRoute.of(context)!.settings.arguments
                        as UserEntity,
                  ),
                ),
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
