// ignore_for_file: file_names

import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/presentation/saved_address_page/view_model/saved_address_cuibt.dart';
import 'package:flora_mart/presentation/saved_address_page/view_model/saved_address_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildAdressWidget extends StatelessWidget {
  const BuildAdressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavedAddressCubit>(
      create: (context) =>
          getIt<SavedAddressCubit>()..doIntent(GetSavedAddressIntent()),
      child: Row(
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
                BlocBuilder<SavedAddressCubit, SavedAddressState>(
                  buildWhen: (previous, current) =>
                      current is GetSavedAddressSuccessState,
                  builder: (context, state) {
                    if (state is GetSavedAddressSuccessState) {
                      return Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          state.getSavedAddressResponce?.addresses?[0].street ??
                              "",
                          style: AppTextStyle.medium14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }
                    return const Text(".......");
                  },
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
      ),
    );
  }
}
