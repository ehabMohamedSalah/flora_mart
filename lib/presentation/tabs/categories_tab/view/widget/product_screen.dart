import 'package:flora_mart/config/theme/app_theme.dart';
import 'package:flora_mart/core/resuable_comp/flower_card_resuble/flower_card_builder.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_cubit.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/cache/shared_pref.dart';
import '../../../../../core/constant.dart';
import '../../../../../core/di/di.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      switch (state) {
        case ProductLoadingState():
          return const Center(child: CircularProgressIndicator());

        case ProductLoadedState():
          print("Loaded Products: ${state.products}");
          if (state.products.isEmpty) {
            return Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.no_sim_sharp,
                  size: 35,
                  color: ColorManager.white70,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "No Product Found !!",
                  style: AppTheme.lightTheme.textTheme.bodyLarge,
                ),
              ],
            ));
          } else {
            final cacheHelper = getIt<CacheHelper>();
            final maxPrice = state.products.isNotEmpty
                ? state.products.map((p) => p.price).reduce((curr, next) => curr! > next! ? curr : next)
                : 0;
            final minPrice = state.products.isNotEmpty
                ? state.products.map((p) => p.price).reduce((curr, next) => curr! < next! ? curr : next)
                : 0;
            cacheHelper.setData(Constant.highestPrice, maxPrice);
            cacheHelper.setData(Constant.lowestPrice, minPrice);
            return FlowerCardBuilder(products: state.products);
          }
        case ProductErrorState():
          return Center(child: Text(state.message));

        default:
          return const SizedBox();
      }
    });
  }
}
