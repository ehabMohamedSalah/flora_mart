import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  const CustomSearchBar({super.key, required this.margin});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorManager.white70,
            width: 1,
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
    );
  }
}
