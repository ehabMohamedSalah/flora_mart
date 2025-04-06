import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_widget.dart';

class BestSellerWidget extends StatelessWidget {
  String image;

  BestSellerWidget({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(
            image: image,
          ),
          Text(
            "Gift card",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text("600 EGP")
        ],
      ),
    );
  }
}
