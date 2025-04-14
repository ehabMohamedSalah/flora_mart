// ignore_for_file: must_be_immutable

import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/cart_screen.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view/categories_screen.dart';
import 'package:flora_mart/presentation/tabs/home_tab/bloc_scope/home_bloc_scope.dart';
import 'package:flora_mart/presentation/tabs/home_tab/home_screen.dart';
import 'package:flora_mart/presentation/tabs/profile_tab/view/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final int initialTab;
  String? selectedCategoryId; // Remove 'final' here

  MainScreen({
    super.key,
    this.initialTab = 0,
    this.selectedCategoryId,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTab;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCategoryTapped(String categoryId) {
    setState(() {
      widget.selectedCategoryId =
          categoryId; // Dynamically update selectedCategory
    });

    // Now navigate after the state is updated
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => MainScreen(
          selectedCategoryId: categoryId,
          initialTab: 1, // Keeping the tab at Categories screen
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeBlocScope(
            child: HomeScreen(
              onViewAllTapped: () => _onCategoryTapped(""),
              onCategoryTapped: (categoryId) {
                _onCategoryTapped(
                    categoryId); // Update the category before navigating
              },
            ),
          ),
          CategoriesScreen(selectedCategoryId: widget.selectedCategoryId),
          const CartScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.category_outlined),
            label: AppStrings.category,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            label: AppStrings.cart,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: AppStrings.profile,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
        backgroundColor: ColorManager.white,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
