import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/category_widget.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/home_screen_slivers/TitleRow.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  final List categories;
  final VoidCallback onSeeAllTap;
  final Function(String) onCategoryTapped;

  const CategoriesSection({
    super.key,
    required this.categories,
    required this.onSeeAllTap,
    required this.onCategoryTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleRowWidget(title: AppStrings.categories, onTap: onSeeAllTap),
          const SizedBox(height: 10),
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
                  label: category.name ?? "",
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
