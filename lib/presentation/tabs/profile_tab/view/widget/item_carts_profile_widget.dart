import 'package:flora_mart/config/theme/app_theme.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCartsProfileWidget extends StatelessWidget {
  final IconData? icon;
  final String title;
  final IconData? iconArrow;
  final String? textLanguage;
  final VoidCallback? onAction;

  const ItemCartsProfileWidget(
      {super.key,
      this.icon,
      required this.title,
      this.iconArrow,
      this.textLanguage,
      required this.onAction});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onAction,
      child: Container(
        color: Colors.transparent,
        height: Config.screenHight! * 0.04,
        child: Row(
          children: [
            Icon(
              icon,
              color: ColorManager.black,
              size: 25,
            ),
            SizedBox(width: 5.w),
            Text(
              title,
              style: AppTheme.lightTheme.textTheme.bodySmall
                  ?.copyWith(color: ColorManager.black),
            ),
            const Spacer(),
            Icon(
              iconArrow,
              color: ColorManager.grey,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
