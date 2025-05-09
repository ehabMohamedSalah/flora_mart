import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/presentation/track_order_screeen/widget/ti/time_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Track Order')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Estimated arrival',
              style: AppTextStyle.medium14.copyWith(color: Colors.grey),
            ),
            const Text(
              '03 Sep 2024, 11:00 AM',
              style: AppTextStyle.medium16,
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Config.spaceMedium,
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset("assets/images/Delivery_Boy.svg"),
              SizedBox(width: Config.screenWidth! * 0.05),
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: AppTextStyle.medium14,
                    ),
                    Text(
                      'Is your delivery hero for today',
                      style: AppTextStyle.regular12,
                    ),
                  ]),
              SizedBox(width: Config.screenWidth! * 0.09),
              SvgPicture.asset("assets/images/call.svg"),
              SizedBox(width: Config.screenWidth! * 0.05),
              SvgPicture.asset("assets/images/whatsapp.svg"),
            ]),
            Config.spaceMedium,
            Center(child: SvgPicture.asset("assets/images/Car.svg")),
            Config.spaceMedium,
            const Expanded(child: TimeLineWidget()),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Show map",
                  style: AppTextStyle.medium18
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                )),
          ],
        ),
      ),
    );
  }
}
