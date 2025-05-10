import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/data/model/order_tracked/order_status.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimeLineWidget extends StatelessWidget {
  final List<OrderStatus> orderStatus;
  const TimeLineWidget({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> steps = [
    //   {'label': 'Received your order', 'isDone': true, "date": "12/12/2022"},
    //   {'label': 'Preparing your order', 'isDone': true, "date": "12/12/2022"},
    //   {'label': 'Out for Delivery', 'isDone': false, "date": "12/12/2022"},
    //   {'label': 'Delivered', 'isDone': false, "date": "12/12/2022"},
    // ];
    Config().init(context);
    return Timeline.tileBuilder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      theme: TimelineThemeData(
        nodePosition: 0,
        nodeItemOverlap: false,
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.after,
        itemExtent: 100,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderStatus[index].statusName ?? "",
                  style: AppTextStyle.medium14,
                ),
                Text(
                  (orderStatus[index].date ?? "").toString(),
                  style: AppTextStyle.regular14.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        indicatorBuilder: (context, index) {
          final isDone = orderStatus[index].isDone ?? false;
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
          final isDone = orderStatus[index].isDone ?? false;

          return SolidLineConnector(
            thickness: 1.5,
            color: isDone ? Theme.of(context).colorScheme.primary : Colors.grey,
          );
        },
        itemCount: orderStatus.length,
      ),
    );
  }
}
