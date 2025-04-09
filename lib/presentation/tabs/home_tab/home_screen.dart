import 'package:flora_mart/presentation/tabs/home_tab/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_screen_slivers/Address_sliver.dart';
import 'widgets/home_screen_slivers/Best_Seller_sliver.dart';
import 'widgets/home_screen_slivers/categories_sliver.dart';
import 'widgets/home_screen_slivers/occaison_sliver.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_cubit.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_intent.dart';
import 'package:flora_mart/core/resuable_comp/search_bar/custom_searchbar_widget.dart';

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
                  buildAddress(),
                  // Show actual categories if data is available
                  buildCategories(homeData?.categories?.take(10).toList() ?? [],
                      widget.onViewAllTapped, context, widget.onCategoryTapped),
                  // Show actual best sellers if data is available
                  buildBestSellers(
                      homeData?.bestSeller?.take(10).toList() ?? [], context),
                  // Show actual occasions if data is available
                  buildOccasions(
                      homeData?.occasions?.take(10).toList() ?? [], context),
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
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset("assets/images/Logo.png", height: 25.h, width: 89.w),
          CustomSearchBar(margin: EdgeInsets.all(3)),
        ],
      ),
    );
  }
// Add these shimmer widgets to your home screen file or a separate file
}
