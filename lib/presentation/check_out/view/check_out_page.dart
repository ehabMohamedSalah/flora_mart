import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/presentation/check_out/view/widgets/delivery_part/delivery_address_widget.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_cubit.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_intents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'widgets/app_bar_delivery_time_widget.dart';
import 'widgets/payment_method_part/payment_method_widget.dart';
import 'widgets/separator.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CheckoutCubit>()
        ..doIntent(InitAddressIntent())
        ..doIntent(InitPaymentWayIntent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.checkout),
          bottom: const AppBarDeliveryTimeWidget(),
        ),
        body: ListView(
          children: const [
            Separator(),
            DeliveryAddressWidget(),
            Separator(),
            PaymentMethodWidget(),
            Separator(),
          ],
        ),
      ),
    );
  }
}
