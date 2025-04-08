// ignore_for_file: must_be_immutable

import 'package:flora_mart/data/model/Home/Occasions.dart';
import 'package:flutter/material.dart';

import 'image_widget.dart';

class OccasionWidget extends StatelessWidget {
  Occasions occasionsModel;

  OccasionWidget({required this.occasionsModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(
            image: occasionsModel.image ?? "",
          ),
          Flexible(
            child: Text(
              occasionsModel.name ?? "",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
