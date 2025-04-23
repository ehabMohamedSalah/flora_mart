import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/data/model/address_model.dart';
import 'package:flora_mart/data/model/getSavedAddressResponce.dart';
import 'package:flora_mart/presentation/address/view/update_address_screen.dart';
import 'package:flora_mart/presentation/saved_address_page/view_model/saved_address_cuibt.dart';
import 'package:flora_mart/presentation/saved_address_page/view_model/saved_address_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedAddressCard extends StatelessWidget {
  Addresses? addresses;
  final VoidCallback onDelete;

  SavedAddressCard(
      {required this.addresses, required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 0, right: 8),
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 24,
                    ),
                  ),
                  Text(
                    addresses?.city ?? "",
                    style: AppTextStyle.medium16,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: onDelete,
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: ColorManager.red,
                      )),
                  IconButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateAddressScreen(
                            addressId: addresses?.id ?? "",
                            address: AddressModel(
                              id: addresses?.id ?? "",
                              street: addresses?.street ?? "",
                              phone: addresses?.phone ?? "",
                              city: addresses?.city ?? "",
                              lat: addresses?.lat == "z"
                                  ? "0.0"
                                  : (addresses?.lat ?? "0.0"),
                              long: addresses?.long == "z"
                                  ? "0.0"
                                  : (addresses?.long ?? "0.0"),
                              username: addresses?.username ?? "",
                            ),
                          ),
                        ),
                      );

                      if (result == true) {
                        // Refresh the saved addresses list
                        context
                            .read<SavedAddressCubit>()
                            .doIntent(GetSavedAddressIntent());
                      }
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              Text(
                addresses?.street ?? "",
                style:
                    AppTextStyle.regular14.copyWith(color: ColorManager.grey),
              ),
            ],
          ),
        ));
  }
}
