import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/categories/all_categories/categories.dart';
import 'package:flora_mart/domain/entity/categories_entity/all_categories_entity/categories_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/custom_tab_bar_widget.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/categories_cubit.dart';

class TabCategories extends StatefulWidget {
  final String id;

  const TabCategories({super.key, required this.id});

  @override
  State<TabCategories> createState() => _TabCategoriesState();
}

class _TabCategoriesState extends State<TabCategories>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  Categories? categories;
  int _selectedIndex = 0;
  List<String> tabNames = ["All"];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  void _loadCategories() async {
    print("🟢 [TabCategories] Loading categories for id=${widget.id}");

    try {
      var response = await getIt<CategoriesCubit>().categoriesUsecase.call(
            id: widget.id,
            name: "",
            productsCount: 0,
          );

      if (response is SuccessApiResult<List<CategoriesEntity>>) {
        if (response.data!.isEmpty) {
          print("⚠️ [TabCategories] No categories found.");
          return;
        }

        setState(() {
          categories = Categories.fromEntity(response.data!.first);
          tabNames.addAll(response.data!.map((e) => e.name ?? "Unnamed"));

          _tabController = TabController(
            length: tabNames.length,
            vsync: this,
          );
          isLoading = false;
        });

        _fetchCategoryData(null);
      } else {
        print("❌ [TabCategories] Failed to load categories.");
      }
    } catch (e) {
      print("🔥 [TabCategories] Exception: ${e.toString()}");
    }
  }

  void _fetchCategoryData(String? selectedCategoryName) async {
    String categoryLog = selectedCategoryName ?? "All";
    print("🔵 [TabCategories] Fetching data for: $categoryLog");

    try {
      var response = await getIt<CategoriesCubit>().categoriesUsecase.call(
            id: widget.id,
            name: selectedCategoryName ?? "",
            productsCount: categories?.productsCount ?? 0,
          );

      if (response is SuccessApiResult<List<CategoriesEntity>>) {
        if (response.data!.isEmpty) {
          print("⚠️ [TabCategories] No data found for $categoryLog.");
          return;
        }

        setState(() {
          categories = Categories.fromEntity(response.data!.first);
        });

        print(
            "✅ [TabCategories] Loaded ${categories!.productsCount} products for $categoryLog.");
      } else {
        print("❌ [TabCategories] Failed to load data for $categoryLog.");
      }
    } catch (e) {
      print("🔥 [TabCategories] Exception: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesCubit>(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (isLoading || _tabController == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return CustomTabBar(
            tabs: tabNames,
            selectedIndex: _selectedIndex,
            controller: _tabController!,
            onTabChanged: (index) {
              setState(() {
                _selectedIndex = index;
                _tabController!.animateTo(index);
              });
              _fetchCategoryData(index == 0 ? null : tabNames[index]);
            },
          );
        },
      ),
    );
  }
}
