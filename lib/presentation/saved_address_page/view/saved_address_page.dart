import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/routes_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/address/view/add_address_screen.dart';
import 'package:flora_mart/presentation/saved_address_page/view/saved_address_card.dart';
import 'package:flora_mart/presentation/saved_address_page/view_model/saved_address_cuibt.dart';
import 'package:flora_mart/presentation/saved_address_page/view_model/saved_address_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedAddressPage extends StatelessWidget {
  const SavedAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<SavedAddressCubit>()..doIntent(GetSavedAddressIntent()),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text(AppStrings.savedAddress),
        ),
        body: BlocListener<SavedAddressCubit, SavedAddressState>(
          listener: (context, state) {
            if (state is GetSavedAddressErrorState ||
                state is DeleteSavedAddressErrorState) {
              toastMessage(
                message: (state as dynamic).message.toString(),
                tybeMessage: TybeMessage.negative,
              );
            }

            if (state is DeleteSavedAddressSuccessState) {
              toastMessage(
                message: AppStrings.yourAddressDeletedSuccessfully,
                tybeMessage: TybeMessage.positive,
              );
            }
          },
          child: BlocBuilder<SavedAddressCubit, SavedAddressState>(
            builder: (context, state) {
              final cubit = SavedAddressCubit.get(context);

              // Remove the loading check for DeleteSavedAddressLoadingState
              if (state is GetSavedAddressLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is GetSavedAddressSuccessState ||
                  state is DeleteSavedAddressSuccessState ||
                  state is DeleteSavedAddressLoadingState) {
                // Add this state
                if (cubit.addresses?.isEmpty ?? true) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            AppStrings.noAddressFound,
                            style:
                                const TextStyle(color: ColorManager.pinkBase),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle add new address
                              Navigator.pushNamed(
                                  context, RouteManager.addAddressScreen);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                AppStrings.addNewAddress,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: Config.screenHight! * 0.4,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: cubit.addresses?.length,
                          itemBuilder: (context, index) {
                            final address = cubit.addresses?[index];
                            return SavedAddressCard(
                              addresses: address,
                              onDelete: () {
                                cubit.doIntent(DeleteSavedAddressIntent(
                                    id: address?.id ?? ""));
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddAddressScreen(),
                              ),
                            );
                            if (result == true) {
                              context
                                  .read<SavedAddressCubit>()
                                  .doIntent(GetSavedAddressIntent());
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              AppStrings.addNewAddress,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
