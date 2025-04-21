import 'package:flora_mart/core/resuable_comp/search_bar/custom_searchbar_widget.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_cubit.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_intent.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/home_screen_slivers/Address_sliver.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/routes_manager.dart';
import 'widgets/home_screen_slivers/Best_Seller_sliver.dart';
import 'widgets/home_screen_slivers/categories_sliver.dart';
import 'widgets/home_screen_slivers/occaison_sliver.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onViewAllTapped;
  final Function(String categoryId) onCategoryTapped;

  const HomeScreen(
      {required this.onCategoryTapped,
      required this.onViewAllTapped,
      super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().doIntent(getHomeDataIntent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar() as PreferredSizeWidget,
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state is GetHomeDataSuccess) {
            final homeData = state.homeResponse;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: BuildAdress()),
                  CategoriesSection(
                    categories: homeData?.categories?.take(10).toList() ?? [],
                    onSeeAllTap: widget.onViewAllTapped,
                    onCategoryTapped: widget.onCategoryTapped,
                  ),
                  BestSellersSection(
                    bestSellers: homeData?.bestSeller?.take(10).toList() ?? [],
                  ),
                  OccasionsSection(
                      occasions: homeData?.occasions?.take(10).toList() ?? []),
                ],
              ),
            );
          }

          // Show shimmer loader while data is loading
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: buildSkeletonLoader(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset("assets/images/Logo.png", height: 25.h, width: 89.w),
           Expanded(
             child: CustomSearchBar(margin: EdgeInsets.all(3),readOnly: true,
               onTap: () {
                 Navigator.pushNamed(
                     context, RouteManager.searchScreen);
               },),
           ),
        ],
      ),
    );
  }
// Add these shimmer widgets to your home screen file or a separate file
}
