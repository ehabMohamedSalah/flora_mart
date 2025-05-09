import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> steps = [
      {'label': 'Order Received', 'isDone': true, "date": "12/12/2022"},
      {'label': 'Processing', 'isDone': true, "date": "12/12/2022"},
      {'label': 'Out for Delivery', 'isDone': false, "date": "12/12/2022"},
      {'label': 'Delivered', 'isDone': false, "date": "12/12/2022"},
    ];
    Config().init(context);
    return Timeline.tileBuilder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      theme: TimelineThemeData(
        nodePosition: 0,
        nodeItemOverlap: false,
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemExtent: 100,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  steps[index]['label'],
                  style: AppTextStyle.medium14,
                ),
                Text(
                  steps[index]['date'],
                  style: AppTextStyle.regular14.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        indicatorBuilder: (context, index) {
          final isDone = steps[index]['isDone'] as bool;
          return IgnorePointer(
            child: SizedBox(
              width: Config.screenWidth! * 0.02,
              height: Config.screenHight! * 0.02,
              child: Radio(
                value: true,
                groupValue: isDone,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (value) {},
              ),
            ),
          );
        },
        connectorBuilder: (context, index, type) {
          return SolidLineConnector(
            thickness: 1.5,
            color: steps[index]['isDone']
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          );
        },
        itemCount: steps.length,
      ),
    );
  }
}
