import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flutter/material.dart';

class AppBarDeliveryTimeWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarDeliveryTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppStrings.deliveryTime,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
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
              )
            ],
          ),
          const Row(
            children: [
              Icon(Icons.access_time_rounded),
              SizedBox(width: 8),
              Text("Instant,"),
              SizedBox(width: 8),
              Text(
                "Arrive by 03 Sep 2024, 11:00 AM",
                style: TextStyle(color: ColorManager.green),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
