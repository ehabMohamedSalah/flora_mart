import 'package:easy_localization/easy_localization.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/Language_bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => const LanguageBottomSheet(),
          );
        },
        child: Text(
          style: const TextStyle(color: ColorManager.pinkBase),
          context.locale == const Locale('en')
              ? AppStrings.english
              : AppStrings.arabic,
        ));
  }
}
