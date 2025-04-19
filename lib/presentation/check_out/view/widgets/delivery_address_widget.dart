import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/data/model/address.dart';
import 'package:flora_mart/presentation/check_out/view/widgets/adress_card.dart';
import 'package:flutter/material.dart';

class DeliveryAddressWidget extends StatefulWidget {
  const DeliveryAddressWidget({super.key});

  @override
  State<DeliveryAddressWidget> createState() => _DeliveryAddressWidgetState();
}

class _DeliveryAddressWidgetState extends State<DeliveryAddressWidget> {
  List<Address> addresses = [
    Address(
      street: "123 Nile Street",
      phone: "+201234567890",
      city: "Cairo",
      lat: "30.0444",
      long: "31.2357",
      username: "Kareem Hekal",
      sId: "1",
    ),
    Address(
      street: "123 Nile Street",
      phone: "+201234567890",
      city: "Cairo",
      lat: "30.0444",
      long: "31.2357",
      username: "Kareem Hekal",
      sId: "565",
    ),
  ];

  String? groupValue;

  @override
  void initState() {
    super.initState();
    if (addresses.isNotEmpty) {
      groupValue = addresses.first.sId ?? "";
    }
  }

  void onSelect(String selectedId) {
    setState(() {
      groupValue = selectedId;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              : buildAddressList(),
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
  }

  Widget buildAddressList() {
    final bool hasManyAddresses = addresses.length >= 3;

    return hasManyAddresses
        ? SizedBox(
            height: Config.screenHight! * 0.3,
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) => buildAddressCard(index),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: addresses.length,
            itemBuilder: (context, index) => buildAddressCard(index),
          );
  }

  Widget buildAddressCard(int index) {
    final address = addresses[index];
    return AddressCard(
      radioValue: address.sId ?? "",
      groupValue: groupValue ?? "",
      address: address,
      onSelect: () => onSelect(address.sId ?? ""),
    );
  }
}
