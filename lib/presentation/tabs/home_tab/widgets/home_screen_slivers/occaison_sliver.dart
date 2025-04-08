import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasion_widget.dart';
import 'package:flutter/material.dart';

import 'TitleRow.dart';

Widget buildOccasions(List occasions, BuildContext context) {
  return SliverToBoxAdapter(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitleRow(AppStrings.occasion, () {}, context),
        SizedBox(height: 10),
        SizedBox(
          height: Config.screenHight! * 0.23,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: occasions.length,
            itemBuilder: (context, index) {
              final occasion = occasions[index];
              return OccasionWidget(
                label: occasion.name ?? '',
                image: occasion.image ?? 'https://picsum.photos/200',
              );
            },
          ),
        ),
      ],
    ),
  );
}
