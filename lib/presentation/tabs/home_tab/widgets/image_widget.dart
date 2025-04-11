// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ImageWidget extends StatelessWidget {
  String image;
  ImageWidget({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 131.w,
      height: 150.h,
      imageUrl: image,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: 131.w,
          height: 150.h,
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error, color: Colors.red)),
    );
  }
}
