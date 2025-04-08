import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_screen_slivers/Address_sliver..dart';
import 'widgets/home_screen_slivers/Best_Seller_sliver.dart';
import 'widgets/home_screen_slivers/categories_sliver.dart';
import 'widgets/home_screen_slivers/occaison_sliver.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_cubit.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_intent.dart';
import 'package:flora_mart/core/resuable_comp/search_bar/custom_searchbar_widget.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onViewAllTapped;

  const HomeScreen({required this.onViewAllTapped, super.key});

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
                  buildCategories(homeData?.categories ?? [],
                      widget.onViewAllTapped, context),
                  buildBestSellers(homeData?.bestSeller ?? [], context),
                  buildOccasions(homeData?.occasions ?? [], context),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
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
}
