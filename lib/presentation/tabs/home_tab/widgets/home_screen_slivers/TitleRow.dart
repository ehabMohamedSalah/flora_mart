import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flutter/material.dart';

class TitleRowWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const TitleRowWidget({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
