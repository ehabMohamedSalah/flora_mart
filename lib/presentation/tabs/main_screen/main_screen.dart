// ignore_for_file: must_be_immutable

import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/dialogs.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_intent.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/cart_screen.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_cubit.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_intent.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view/categories_screen.dart';
import 'package:flora_mart/presentation/tabs/home_tab/bloc_scope/home_bloc_scope.dart';
import 'package:flora_mart/presentation/tabs/home_tab/home_screen.dart';
import 'package:flora_mart/presentation/tabs/profile_tab/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    AuthCubit.get(context).doIntent(CheckGuestIntent());
    _selectedIndex = widget.initialTab;
  }

  void _onItemTapped(int index) {
    if ((index == 2 || index == 3) && AuthCubit.get(context).isguest == true) {
      Dialogs.restrictedAccess(context, () => Navigator.pop(context));
      return; // لا تغيّر التاب
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCategoryTapped(String categoryId) {
    setState(() {
      widget.selectedCategoryId = categoryId;
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
          BlocProvider<CartCubit>(
            key: ValueKey(_selectedIndex == 2), // أو UniqueKey() لو حبيت
            create: (context) =>
                getIt<CartCubit>()..doIntent(GetCartItemsIntent()),

            child: const CartScreen(),
          ),
          _selectedIndex == 3
              ? ProfileScreen(key: UniqueKey())
              : const CircularProgressIndicator(
                  color: Colors.black,
                ),
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
