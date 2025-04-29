// ignore_for_file: use_build_context_synchronously

import 'package:badges/badges.dart' as badges;
import 'package:flora_mart/config/theme/app_theme.dart';
import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/routes_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/domain/entity/auth/user_entity.dart';
import 'package:flora_mart/presentation/Language_bottom_sheet/Wigets/language_button.dart';
import 'package:flora_mart/presentation/about_us_screen/About_us_screen.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_intent.dart';
import 'package:flora_mart/presentation/notification_screen/view/notification_screen.dart';
import 'package:flora_mart/presentation/notification_screen/view_model/notification_cubit.dart';
import 'package:flora_mart/presentation/notification_screen/view_model/notification_intent.dart';
import 'package:flora_mart/presentation/saved_address_page/view/saved_address_page.dart';
import 'package:flora_mart/presentation/tabs/profile_tab/view/widget/item_carts_profile_widget.dart';
import 'package:flora_mart/presentation/tabs/profile_tab/view_model/main_profile_cubit.dart';
import 'package:flora_mart/presentation/tabs/profile_tab/view_model/main_profile_intent.dart';
import 'package:flora_mart/presentation/terms_and_conditions/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resuable_comp/dialogs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationTurn = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? addressId; // Add this line to declare the addressId variable

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<MainProfileCubit>()..onIntent(DataProfileCubitIntent()),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(),
        body: BlocBuilder<MainProfileCubit, MainProfileState>(
          builder: (context, state) {
            if (state is MainProfileLoading) {
              return const Center(
                  child:
                      CircularProgressIndicator(color: ColorManager.pinkBase));
            }
            if (state is MainProfileSuccess) {
              UserEntity? user = state.getLoggedUserDataEntity.user;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: user?.photo?.isNotEmpty == true
                                ? NetworkImage(user!.photo!)
                                : null,
                            backgroundColor: ColorManager.white60,
                            child: user?.photo?.isNotEmpty != true
                                ? const Icon(
                                    Icons.person,
                                    size: 50,
                                  )
                                : null,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                user?.firstName ?? "First Name",
                                style: AppTheme.lightTheme.textTheme.bodyLarge
                                    ?.copyWith(color: ColorManager.black),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () async {
                                  final result = await Navigator.pushNamed(
                                    context,
                                    RouteManager.editProfileScreen,
                                    arguments: user,
                                  );

                                  if (result == true) {
                                    if (mounted) {
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      context.read<MainProfileCubit>()
                                        ..onIntent(DataProfileCubitIntent())
                                        ..onIntent(
                                            DataProfileCubitIntent()); // Call twice to force refresh
                                    }
                                  }
                                },
                                icon: const Icon(Icons.edit, size: 20),
                              )
                            ],
                          ),
                          Text(
                            user?.email ?? "Email",
                            style: AppTheme.lightTheme.textTheme.bodyLarge,
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      ItemCartsProfileWidget(
                        title: AppStrings.myOrders,
                        icon: Icons.list_alt_outlined,
                        iconArrow: Icons.keyboard_arrow_right_outlined,
                        onAction: () {},
                      ),
                      ItemCartsProfileWidget(
                        title: AppStrings.savedAddress,
                        icon: Icons.location_on_outlined,
                        iconArrow: Icons.keyboard_arrow_right_outlined,
                        onAction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SavedAddressPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide.lerp(
                                BorderSide.none,
                                const BorderSide(
                                    color: ColorManager.white70, width: 3),
                                0.5),
                            bottom: BorderSide.lerp(
                                const BorderSide(
                                    color: ColorManager.white70, width: 3),
                                BorderSide.none,
                                0.5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Switch(
                              value: isNotificationTurn,
                              onChanged: (newValue) {
                                setState(() {
                                  isNotificationTurn = newValue;
                                });
                              },
                              activeColor: Colors.white,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                            ),
                            Text(
                              AppStrings.notification,
                              style: AppTheme.lightTheme.textTheme.bodySmall
                                  ?.copyWith(color: ColorManager.black),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: ColorManager.grey,
                                  size: 25,
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.translate_outlined,
                            color: ColorManager.black,
                            size: 25,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            AppStrings.changeLanguage,
                            style: AppTheme.lightTheme.textTheme.bodySmall
                                ?.copyWith(color: ColorManager.black),
                          ),
                          const Spacer(),
                          const LanguageButton(),
                        ],
                      ),
                      ItemCartsProfileWidget(
                        title: AppStrings.aboutUs,
                        iconArrow: Icons.keyboard_arrow_right_outlined,
                        onAction: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutUsScreen()));
                        },
                      ),
                      ItemCartsProfileWidget(
                        title: AppStrings.termsandConditions,
                        iconArrow: Icons.keyboard_arrow_right_outlined,
                        onAction: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TermsAndConditionsScreen()));
                        },
                      ),
                      const SizedBox(height: 12),
                      BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is LogoutLoadingState) {
                            showDialog(
                              context: context,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primaryColor,
                                ),
                              ),
                            );
                          }

                          if (state is LogoutSuccessState) {
                            toastMessage(
                                message: "Logout Successfully, Back to login",
                                tybeMessage: TybeMessage.positive);

                            // Wait for 2 seconds, then navigate to login
                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RouteManager.loginScreen,
                                (route) => false,
                              );
                            });
                          }

                          if (state is LogoutFailureState) {
                            Navigator.pop(context);
                            toastMessage(
                                message: "Error : ${state.message}",
                                tybeMessage: TybeMessage.negative);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide.lerp(
                                  BorderSide.none,
                                  const BorderSide(
                                      color: ColorManager.white70, width: 3),
                                  0.5),
                            ),
                          ),
                          child: ItemCartsProfileWidget(
                            title: AppStrings.logout,
                            icon: Icons.logout_outlined,
                            iconArrow: Icons.keyboard_arrow_right_outlined,
                            onAction: () {
                              Dialogs.confirmLogout(
                                context,
                                () => Navigator.pop(context),
                                () => context
                                    .read<AuthCubit>()
                                    .doIntent(LogoutIntent()),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is MainProfileFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTheme.lightTheme.textTheme.bodyLarge,
                ),
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: ColorManager.pinkBase,
            ));
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    int badgeCounter = 3;
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset("assets/images/Logo.png", height: 25, width: 89),
          const Spacer(),
          badges.Badge(
            badgeContent: Text(
              badgeCounter.toString(),
              style: AppTheme.lightTheme.textTheme.titleSmall,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => getIt<NotificationCubit>()
                          ..doIntent(GetNotificationIntent()),
                        child: const NotificationScreen(),
                      ),
                    ));
                // Navigator.pushNamed(context, RouteManager.notificationScreen);
              },
              icon: const Icon(
                Icons.notifications_none,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
