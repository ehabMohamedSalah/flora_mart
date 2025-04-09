import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/Category%20widget.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/home_screen_slivers/TitleRow.dart';
import 'package:flutter/material.dart';

Widget buildCategories(List categories,
    VoidCallback onTap,
    BuildContext context,
    Function(String) onCategoryTapped,) {
  return SliverToBoxAdapter(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitleRow(AppStrings.categories, () {
          onTap();
        }, context),
        SizedBox(height: 10),
        SizedBox(
          height: Config.screenHight! * 0.15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryWidget(
                  onTap: () => onCategoryTapped(category.id),
                  image: category.image ?? "",
                  label: category.name ?? "");
            },
          ),
        ),
        SizedBox(height: 10),
      ],
    ),
  );
}
