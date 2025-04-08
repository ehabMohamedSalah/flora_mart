// Best Seller Section
import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/best_seller/best_seller_screen.dart';
import 'package:flora_mart/presentation/best_seller/bloc_scope/best_seller_bloc_scope.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/best_seller_widget.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/home_screen_slivers/TitleRow.dart';
import 'package:flutter/material.dart';

Widget buildBestSellers(List bestSellers, BuildContext context) {
  return SliverToBoxAdapter(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitleRow(AppStrings.bestSeller, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BestSellerBlocScope(
                child: BestSellerScreen(),
              ),
            ),
          );
        }, context),
        SizedBox(height: 10),
        SizedBox(
          height: Config.screenHight! * 0.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bestSellers.length,
            itemBuilder: (context, index) {
              final product = bestSellers[index];
              return BestSellerWidget(
                bestSellerModel: product,
              );
            },
          ),
        ),
      ],
    ),
  );
}
