// ignore_for_file: file_names

import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flutter/material.dart';

Widget buildTitleRow(String title, VoidCallback? onTap, BuildContext context) {
  return Row(
    children: [
      Text(title, style: Theme.of(context).textTheme.titleLarge),
      const Spacer(),
      GestureDetector(
        onTap: onTap,
        child: Text(
          AppStrings.viewAll,
          style: const TextStyle(
            decoration: TextDecoration.underline,
            decorationColor: ColorManager.pinkBase,
            decorationThickness: 2.0,
            color: ColorManager.pinkBase,
          ),
        ),
      ),
    ],
  );
}
