// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flora_mart/core/api/firebase_api.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/data/model/address_model.dart';
import 'package:flora_mart/domain/entity/auth/user_entity.dart';
import 'package:flora_mart/presentation/address/view/add_address_screen.dart';
import 'package:flora_mart/presentation/address/view/update_address_screen.dart';
import 'package:flora_mart/presentation/address/view_model/address_cubit.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/forget_password_screen.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/reset_password_screen.dart';
import 'package:flora_mart/presentation/auth/forget_password/view/forget_password/view/verify_reset_code_screen.dart';
import 'package:flora_mart/presentation/auth/login/login_screen.dart';
import 'package:flora_mart/presentation/auth/register/view/register_screen.dart';
import 'package:flora_mart/presentation/change_password/change_password_screen.dart';
import 'package:flora_mart/presentation/change_password/cubit/change_password_cubit.dart';
import 'package:flora_mart/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:flora_mart/presentation/edit_profile_screen/view_model/edit_profile_cubit.dart';
import 'package:flora_mart/presentation/search_screen/search_screen.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_cubit.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view/occasion_widget.dart';
import 'package:flora_mart/presentation/tabs/main_screen/main_screen.dart';
import 'package:flora_mart/presentation/track_order_screeen/track_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/theme/app_theme.dart';
import 'core/utils/routes_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Ensure context is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FirebaseApi().handleContextListeners(context);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          navigatorKey: FirebaseApi.navigatorKey,
          debugShowCheckedModeBanner: false,

          // routes: {
          //   RouteManager.homeScreen: (context) => HomeScreen(),
          //   RouteManager.cartScreen: (context) => CartScreen(),
          //   RouteManager.profileScreen: (context) => ProfileScreen(),
          //   RouteManager.categoriesScreen: (context) => CategoriesScreen(),
          // },

          routes: {
            RouteManager.mainScreen: (context) => MainScreen(),
            RouteManager.searchScreen: (context) => BlocProvider(
                  create: (context) => getIt<ProductCubit>(),
                  child: const SearchScreen(),
                ),
            RouteManager.changePasswordScreen: (context) => BlocProvider(
                  create: (context) => getIt<ChangePasswordCubit>(),
                  child: const ChangePasswordScreen(),
                ),
            RouteManager.occasionScreen: (context) => const OccasionScreen(),
            RouteManager.loginScreen: (context) => const SignInScreen(),
            RouteManager.registerScreen: (context) => const RegisterScreen(),
            RouteManager.addAddressScreen: (context) =>
                const AddAddressScreen(),
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
            RouteManager.updateAddressScreen: (context) => BlocProvider(
                  create: (context) => getIt<AddressCubit>(),
                  child: UpdateAddressScreen(
                    addressId: (ModalRoute.of(context)!.settings.arguments
                        as Map)['addressId'] as String,
                    address: (ModalRoute.of(context)!.settings.arguments
                        as Map)['address'] as AddressModel,
                  ),
                ),
          },

          theme: AppTheme.lightTheme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // initialRoute: initialRoute(),
          home: const TrackOrderScreen(),
        );
      },
    );
  }
}
