// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'image_widget.dart';

class OccasionWidget extends StatelessWidget {
  String image;
  OccasionWidget({required this.image, super.key});

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
            "birthday",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
