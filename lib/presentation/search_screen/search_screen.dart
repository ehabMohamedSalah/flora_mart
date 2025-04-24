// ignore_for_file: must_be_immutable

import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/search_bar/custom_searchbar_widget.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view/widget/product_screen.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_cubit.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/colors_manager.dart';
import '../../core/utils/string_manager.dart';
import '../tabs/categories_tab/view_model/product_state.dart';

class SearchScreen extends StatefulWidget {

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = "";
  late final ProductCubit _productCubit;

  @override
  void initState() {
    super.initState();
    _productCubit = getIt<ProductCubit>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            spacing: 10,
            children: [
              CustomSearchBar(margin: const EdgeInsets.symmetric(horizontal: 15),readOnly: false,
                onSubmitted: (value){
                  setState(() {
                    searchQuery = value.toString() ;
                  });
                  print("value : ${value.toString()}");
                  _productCubit.doIntent(GetProductsBasedOnSearchQueryIntent(searchQuery));
                },
              ),
              Expanded(
                child: BlocProvider.value(
                  value: _productCubit,
                  child: BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (searchQuery.isEmpty) {
                        return Center(
                          child: Text(
                            AppStrings.searchForAnyProductYouWant,
                            style: const TextStyle(
                              color: ColorManager.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }
                      return const ProductScreen();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

