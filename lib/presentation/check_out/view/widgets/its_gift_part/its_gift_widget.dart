import 'package:flora_mart/core/resuable_comp/custom_text_field.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/presentation/check_out/view/widgets/separator.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_intents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_cubit.dart';

class ItsGiftWidget extends StatelessWidget {
  const ItsGiftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutStates>(
      builder: (context, state) {
        final cubit = CheckoutCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(spacing: 15, children: [
            Row(
              children: [
                Switch(
                  value: cubit.isGift,
                  onChanged: (newValue) {
                    cubit.doIntent(
                      SelectGiftIntent(isSelected: newValue),
                    );
                  },
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                ),
                Text(AppStrings.itIsAGift, style: AppTextStyle.medium18),
              ],
            ),
            if (cubit.isGift == true)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomTextField(
                      labelText: AppStrings.name,
                      hintText: AppStrings.enterTheName,
                      controller: cubit.NameController,
                      keyboard: TextInputType.text,
                      validator: (data) =>
                          (data?.isEmpty ?? true) ? 'Invalid first name' : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomTextField(
                      labelText: AppStrings.phoneNumber,
                      hintText: AppStrings.enterPhoneNumber,
                      controller: cubit.phoneController,
                      keyboard: TextInputType.phone,
                      validator: (data) => (data?.isEmpty ?? true)
                          ? AppStrings.invalidPhoneNumber
                          : null,
                    ),
                  ),
                ],
              ),
          ]),
        );
      },
    );
  }
}
