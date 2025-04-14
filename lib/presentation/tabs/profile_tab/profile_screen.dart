import 'package:flora_mart/presentation/Language_bottom_sheet/Wigets/language_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cache/shared_pref.dart';
import '../../../core/constant.dart';
import '../../../core/resuable_comp/toast_message.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/routes_manager.dart';
import '../../auth/view_model/cubit/auth_cubit.dart';
import '../../auth/view_model/cubit/auth_intent.dart';

class ProfileScreen extends StatelessWidget {

   const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
        'Profile Screen',
        style: Theme.of(context).textTheme.headlineLarge,
      );

    return const Center(child: LanguageButton());
  }
}
