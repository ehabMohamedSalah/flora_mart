import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 68.w,
            height: 64.h,
            child: Icon(Icons.card_giftcard, size: 24.sp,color: ColorManager.pink,),
            decoration: BoxDecoration(
              color: ColorManager.lightPink,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Text("Gift card")
        ],
      ),
    );
  }
}
