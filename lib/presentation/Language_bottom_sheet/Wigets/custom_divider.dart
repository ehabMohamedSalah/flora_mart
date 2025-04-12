import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 80,
      decoration: const BoxDecoration(
          color: ColorManager.grey,
          borderRadius: BorderRadius.all(Radius.circular(8))),
    );
  }
}
