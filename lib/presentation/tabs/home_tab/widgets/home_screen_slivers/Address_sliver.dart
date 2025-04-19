// ignore_for_file: file_names

import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class BuildAdress extends StatelessWidget {
  const BuildAdress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined),
        const SizedBox(width: 8),
        Flexible(
          fit: FlexFit.loose,
          child: Row(
            children: [
              Text(
                "Deliver to ",
                style: AppTextStyle.medium14.copyWith(color: Colors.grey),
              ),
              const Flexible(
                fit: FlexFit.loose,
                child: Text(
                  "2XVP+XC - Sheikh Zayed",
                  style: AppTextStyle.medium14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Icon(
          Icons.keyboard_arrow_down_sharp,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
