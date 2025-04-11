import 'package:flora_mart/config/theme/app_theme.dart';
import 'package:flora_mart/core/resuable_comp/flower_card_resuble/flower_card_builder.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_cubit.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  final String typeId;
  final String type;

  const ProductScreen({
    super.key,
    required this.typeId,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      switch (state) {
        case ProductLoadingState():
          return const Center(child: CircularProgressIndicator());

        case ProductLoadedState():
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
