import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/data/model/address.dart';
import 'package:flora_mart/presentation/check_out/view/widgets/delivery_part/adress_card.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_cubit.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_intents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutStates>(
      builder: (context, state) {
        final cubit = CheckoutCubit.get(context);
        final addresses = cubit.addresses;
        final selectedAddressId = cubit.selectedAddressId;

        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.deliveryAddress, style: AppTextStyle.medium18),
              const SizedBox(height: 8),
              addresses.isEmpty
                  ? Center(
                      child: Text(
                        AppStrings.noAddressFound,
                        style: AppTextStyle.medium18
                            .copyWith(color: ColorManager.pinkBase),
                      ),
                    )
                  : _buildAddressList(addresses, selectedAddressId, context),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.addNewAddress,
                    style: const TextStyle(color: ColorManager.pinkBase),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddressList(
      List<Address> addresses, String? selectedId, BuildContext context) {
    final hasManyAddresses = addresses.length >= 3;

    final listView = ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) =>
          _buildAddressCard(index, addresses, selectedId, context),
    );

    return hasManyAddresses
        ? SizedBox(height: Config.screenHight! * 0.3, child: listView)
        : ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              addresses.length,
              (index) =>
                  _buildAddressCard(index, addresses, selectedId, context),
            ),
          );
  }

  Widget _buildAddressCard(
    int index,
    List<Address> addresses,
    String? selectedAddressId,
    BuildContext context,
  ) {
    final address = addresses[index];
    return AddressCard(
      radioValue: address.sId ?? "",
      groupValue: selectedAddressId ?? "",
      address: address,
      onSelect: () {
        CheckoutCubit.get(context).doIntent(
          SelectAddressIntent(id: address.sId ?? ""),
        );
      },
    );
  }
}
