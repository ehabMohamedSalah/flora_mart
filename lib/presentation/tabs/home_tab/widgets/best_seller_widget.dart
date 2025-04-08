import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_widget.dart';

class BestSellerWidget extends StatelessWidget {
  String image;
  String label;
  String price;

  BestSellerWidget(
      {required this.label,
      required this.price,
      required this.image,
      super.key});

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
          Flexible(
            child: Text(
              label.length > 15 ? '${label.substring(0, 15)}...' : label,
              softWrap: true,
            ),
          ),
          Flexible(child: Text("$price EGP"))
        ],
      ),
    );
  }
}
