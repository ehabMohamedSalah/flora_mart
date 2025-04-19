import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarDeliveryTimeWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarDeliveryTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppStrings.deliveryTime,
                style: AppTextStyle.medium18),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.schedule,
                  style: const TextStyle(
                      color: ColorManager.pinkBase,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.access_time_rounded),
                const SizedBox(width: 8),
                const Text("Instant,"),
                const SizedBox(width: 8),
                Text(
                  "Arrive by 03 Sep 2024, 11:00 AM",
                  style: TextStyle(fontSize: 14.sp, color: ColorManager.green),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
