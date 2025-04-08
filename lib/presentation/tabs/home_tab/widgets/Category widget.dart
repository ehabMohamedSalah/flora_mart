import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  String label;
  String image;

  CategoryWidget({required this.label, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.lightPink,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.network(
                  image,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
