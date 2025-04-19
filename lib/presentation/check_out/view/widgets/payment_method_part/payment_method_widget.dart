import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/presentation/check_out/view/widgets/payment_method_part/payment_way_card.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_cubit.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_intents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutStates>(
      builder: (context, state) {
        final cubit = CheckoutCubit.get(context);

        return Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.paymentMethod, style: AppTextStyle.medium18),
                PaymentWayCard(
                  label: AppStrings.cashOnDelivery,
                  radioValue: "CacheOnDelivery",
                  groupValue: cubit.selectedPaymentWayId ?? "",
                  onSelect: () {
                    CheckoutCubit.get(context).doIntent(
                      SelectPaymentWayIntent(id: Constant.cacheOnDelivery),
                    );
                  },
                ),
                PaymentWayCard(
                  label: AppStrings.creditCard,
                  radioValue: "CreditCard",
                  groupValue: cubit.selectedPaymentWayId ?? "",
                  onSelect: () {
                    CheckoutCubit.get(context).doIntent(
                      SelectPaymentWayIntent(id: Constant.creditCard),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
