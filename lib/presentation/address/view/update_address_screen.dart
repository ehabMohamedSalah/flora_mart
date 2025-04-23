// ignore_for_file: prefer_final_fields

import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/data/model/address_model.dart';
import 'package:flora_mart/presentation/address/view/address_form_screen.dart';
import 'package:flora_mart/presentation/address/view_model/address_cubit.dart';
import 'package:flora_mart/presentation/address/view_model/address_intent.dart';
import 'package:flora_mart/presentation/address/view_model/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateAddressScreen extends StatelessWidget {
  final String addressId;
  final AddressModel address;

  const UpdateAddressScreen({
    super.key,
    required this.addressId,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddressCubit>(),
      child: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is UpdateAddressSuccessState) {
            // Change this line
            toastMessage(
              message: "Address updated successfully",
              tybeMessage: TybeMessage.positive,
            );
            Navigator.pop(context, true);
          } else if (state is UpdateAddressErrorState) {
            // Add error handling
            toastMessage(
              message: state.message,
              tybeMessage: TybeMessage.negative,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            // appBar: AppBar(
            //   title: const Text('Update Address'),
            //),
            body: Stack(
              children: [
                AddressFormScreen(
                  address: address,
                  submitButtonText: 'Update Address',
                  onSubmit: (street, phone, city, latitude, longitude,
                      recipientName) {
                    context.read<AddressCubit>().doIntent(
                          UpdateAddressIntent(
                            addressId: addressId,
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
                if (state is UpdateAddressLoadingState) // Add loading indicator
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
