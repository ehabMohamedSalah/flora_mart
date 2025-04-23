import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/data/model/address_model.dart';
import 'package:flora_mart/data/model/getSavedAddressResponce.dart';
import 'package:flora_mart/presentation/address/view/update_address_screen.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_cubit.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_intents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCard extends StatelessWidget {
  final Addresses address;
  final String radioValue;
  final String groupValue;
  final VoidCallback onSelect;

  const AddressCard({
    required this.radioValue,
    required this.groupValue,
    required this.address,
    required this.onSelect,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        Radio(
                          value: radioValue,
                          groupValue: groupValue,
                          activeColor: ColorManager.pinkBase,
                          onChanged: (value) => onSelect(),
                        ),
                        Text(address.username ?? "",
                            style: AppTextStyle.medium16),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      address.street ?? "",
                      style: AppTextStyle.regular14
                          .copyWith(color: ColorManager.white70),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                final addressModel = AddressModel(
                  id: address.id ?? "",
                  street: address.street ?? "",
                  city: address.city ?? "",
                  phone: address.phone ?? "",
                  username: address.username ?? "",
                  lat: address.lat ?? "",
                  long: address.long ?? "",
                );

                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateAddressScreen(
                      addressId: address.id ?? "",
                      address: addressModel,
                    ),
                  ),
                );

                if (result == true) {
                  // Refresh the addresses in checkout page
                  context
                      .read<CheckoutCubit>()
                      .doIntent(GetSavedAddressIntent());
                }
              },
              icon: const Icon(
                Icons.edit,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
