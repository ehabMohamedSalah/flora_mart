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

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  String productID = "";
  late final ProductCubit _productCubit;

  @override
  void initState() {
    super.initState();
    _productCubit = getIt<ProductCubit>();
    _productCubit.doIntent(GetProductsIntent(productID, 'category'));
  }

  @override
  void dispose() {
    _productCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: Column(
            spacing: 10,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomSearchBar(margin: EdgeInsets.zero),
                  SizedBox(width: 10.w),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: ColorManager.white70, width: 1),
                    ),
                    child: Icon(Icons.format_align_left,
                        color: ColorManager.white70, size: 24),
                  ),
                ],
              ),
              Expanded(
                flex: 0,
                child: TabCategories(
                  id: productID,
                  onCategorySelected: (selectedCategoryName) {
                    setState(() {
                      productID = selectedCategoryName ?? "";
                    });
                    _productCubit.doIntent(
                      GetProductsIntent(productID, 'category'),
                    );
                  },
                ),
              ),
              SizedBox(height: 5.h),
              Expanded(
                flex: 6,
                child: BlocProvider.value(
                  value: _productCubit,
                  child: ProductScreen(
                    typeId: productID,
                    type: "category",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      onPressed: () {},
      icon: Icon(Icons.tune),
      label: Text(AppStrings.filter),
    );
  }
}
