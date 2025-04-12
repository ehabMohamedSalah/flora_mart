import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/routes_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasion_widget.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view/occasion_widget.dart';
import 'package:flutter/material.dart';

import 'TitleRow.dart';

class OccasionsSection extends StatelessWidget {
  final List occasions;

  const OccasionsSection({
    Key? key,
    required this.occasions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleRowWidget(
              title: AppStrings.occasion,
              onTap: () {
                Navigator.pushNamed(context, RouteManager.occasionScreen);
              }),
          const SizedBox(height: 10),
          SizedBox(
            height: Config.screenHight! * 0.23,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: occasions.length,
              itemBuilder: (context, index) {
                final occasion = occasions[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OccasionScreen(
                          selectedOccasionId: occasion.id,
                        ),
                      ),
                    );
                  },
                  child: OccasionWidget(
                    occasionsModel: occasion,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
