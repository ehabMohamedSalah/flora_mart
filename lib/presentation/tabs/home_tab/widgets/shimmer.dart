import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildSkeletonLoader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildAddressShimmer(),
      SizedBox(height: 20.h),
      _buildCategoryShimmer(),
      SizedBox(height: 20.h),
      _buildBestSellerShimmer(),
      SizedBox(height: 20.h),
      _buildOccasionShimmer(),
    ],
  );
}

LinearGradient _greyShimmerGradient() {
  return LinearGradient(
    colors: [
      Color(0xFFF5F5F5), // Very light grey
      Color(0xFFE0E0E0), // Light grey
      Color(0xFFF5F5F5), // Very light grey again for shimmer effect
    ],
    stops: [0.1, 0.5, 0.9],
  );
}

Widget _buildAddressShimmer() {
  return Container(
    height: 70.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: _greyShimmerGradient(),
    ),
  );
}

Widget _buildCategoryShimmer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 50.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: _greyShimmerGradient(),
        ),
      ),
      SizedBox(height: 10.h),
      SizedBox(
        height: 100.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Container(
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: _greyShimmerGradient(),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget _buildBestSellerShimmer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 20.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: _greyShimmerGradient(),
        ),
      ),
      SizedBox(height: 10.h),
      SizedBox(
        height: 150.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: _greyShimmerGradient(),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    width: 100.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: _greyShimmerGradient(),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    width: 60.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: _greyShimmerGradient(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget _buildOccasionShimmer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 50.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: _greyShimmerGradient(),
        ),
      ),
      SizedBox(height: 10.h),
      SizedBox(
        height: 150.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: _greyShimmerGradient(),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    width: 100.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: _greyShimmerGradient(),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    width: 60.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: _greyShimmerGradient(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
