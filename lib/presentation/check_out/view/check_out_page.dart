import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flutter/material.dart';

import 'widgets/app_bar_delivery_time_widget.dart';
import 'widgets/delivery_address_widget.dart';
import 'widgets/separator.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.checkout),
          bottom: const AppBarDeliveryTimeWidget(),
        ),
        body: ListView(
          children: const [
            Separator(),
            DeliveryAddressWidget(),
            Separator(),
          ],
        ));
  }
}
