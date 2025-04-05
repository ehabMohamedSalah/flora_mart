// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          Center(child: Icon(Icons.error, color: Colors.red)),
    );
  }
}
