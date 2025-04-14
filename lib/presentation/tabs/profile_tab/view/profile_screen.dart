import 'package:badges/badges.dart' as badges;
import 'package:flora_mart/config/theme/app_theme.dart';
import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/domain/entity/auth/user_entity.dart';
import 'package:flora_mart/presentation/tabs/profile_tab/view/widget/item_carts_profile_widget.dart';
import 'package:flora_mart/presentation/tabs/profile_tab/view_model/main_profile_cubit.dart';
import 'package:flora_mart/presentation/tabs/profile_tab/view_model/main_profile_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationTurn = true;
  String selectLanguage = "English";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainProfileCubit>()
        ..onIntent(DataProfileCubitIntent()),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(),
        body: BlocBuilder<MainProfileCubit, MainProfileState>(
          builder: (context, state) {
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
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: ColorManager.white60,
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
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
                              const Icon(
                                Icons.edit,
                                size: 20,
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
                        onAction: () {},
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
                                }),
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
                      ItemCartsProfileWidget(
                        title: AppStrings.languageItem,
                        icon: Icons.translate_outlined,
                        textLanguage: selectLanguage,
                        onAction: () {},
                      ),
                      ItemCartsProfileWidget(
                        title: AppStrings.aboutUs,
                        iconArrow: Icons.keyboard_arrow_right_outlined,
                        onAction: () {},
                      ),
                      ItemCartsProfileWidget(
                        title: AppStrings.termsandConditions,
                        iconArrow: Icons.keyboard_arrow_right_outlined,
                        onAction: () {},
                      ),
                      const SizedBox(height: 12),
                      Container(
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
                          onAction: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is MainProfileFailure) {
              print(state.message);
              return Center(
                child: Text(
                  state.message,
                  style: AppTheme.lightTheme.textTheme.bodyLarge,
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
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
            child: const Icon(
              Icons.notifications_none,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}