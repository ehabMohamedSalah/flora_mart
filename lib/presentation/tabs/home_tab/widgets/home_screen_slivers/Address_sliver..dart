import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

Widget buildAddress() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined),
          Text("Deliver to 2XVP+XC - Sheikh Zayed"),
          Flexible(
            child: Icon(Icons.keyboard_arrow_down_sharp,
                size: 50, color: ColorManager.pinkBase),
          ),
        ],
      ),
    ),
  );
}
