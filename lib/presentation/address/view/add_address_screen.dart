import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/presentation/address/view/address_form_screen.dart';
import 'package:flora_mart/presentation/address/view_model/address_cubit.dart';
import 'package:flora_mart/presentation/address/view_model/address_intent.dart';
import 'package:flora_mart/presentation/address/view_model/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddressCubit>(),
      child: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is addAddressSuccessState) {
            toastMessage(
              message: "Address added successfully",
              tybeMessage: TybeMessage.positive,
            );
            Navigator.pop(context, true);
          } else if (state is addAddressErrorState) {
            toastMessage(
              message: state.message,
              tybeMessage: TybeMessage.negative,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                AddressFormScreen(
                  submitButtonText: 'Add New Address',
                  onSubmit: (street, phone, city, latitude, longitude,
                      recipientName) {
                    context.read<AddressCubit>().doIntent(
                          AddAddressIntent(
                            street: street,
                            phone: phone,
                            city: city,
                            latitude: latitude,
                            longitude: longitude,
                            recipientName: recipientName,
                          ),
                        );
                  },
                ),
                if (state is addAddressLoadingState)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
