import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class PaymentWayCard extends StatelessWidget {
  final String label;
  final String radioValue;
  final String groupValue;
  final VoidCallback onSelect;

  const PaymentWayCard(
      {required this.label,
      required this.radioValue,
      required this.groupValue,
      required this.onSelect,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              label,
              style: AppTextStyle.regular16,
            ),
            const Spacer(),
            Radio(
              splashRadius: 10,
              value: radioValue,
              groupValue: groupValue,
              activeColor: ColorManager.pinkBase,
              onChanged: (value) => onSelect(),
            ),
          ],
        ),
      ),
    );
  }
}
