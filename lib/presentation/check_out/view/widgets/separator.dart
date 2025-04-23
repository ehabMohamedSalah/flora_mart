import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white50,
      width: Config.screenWidth,
      height: Config.screenHight! * 0.03,
    );
  }
}
