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
