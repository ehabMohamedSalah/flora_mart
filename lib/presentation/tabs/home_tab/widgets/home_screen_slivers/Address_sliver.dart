// ignore_for_file: file_names

import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

Widget buildAddress() {
  return const SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Icon(Icons.location_on_outlined),
            SizedBox(width: 8),
            Text(
              "Deliver to 2XVP+XC - Sheikh Zayed",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 30,
              color: ColorManager.pinkBase,
            ),
          ],
        ),
      ),
    ),
  );
}
