// ignore_for_file: must_be_immutable

import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/search_bar/custom_searchbar_widget.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view/widget/product_screen.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view/widget/tab_categories.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_cubit.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            spacing: 10,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomSearchBar(margin: EdgeInsets.zero),
                  SizedBox(width: 10.w),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: ColorManager.white70, width: 1),
                    ),
                    child: const Icon(Icons.format_align_left,
                        color: ColorManager.white70, size: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
