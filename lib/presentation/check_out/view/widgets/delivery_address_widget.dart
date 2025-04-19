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
  List<Address> Addresses = [
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
      street: "456 Alexandria Road",
      phone: "+201098765432",
      city: "Alexandria",
      lat: "31.2001",
      long: "29.9187",
      username: "Ahmed Ali",
      sId: "2",
    ),
    Address(
      street: "789 Giza Square",
      phone: "+201112223334",
      city: "Giza",
      lat: "30.0131",
      long: "31.2089",
      username: "Sara Youssef",
      sId: "3",
    ),
  ];

  String? groupValue;

  @override
  void initState() {
    super.initState();
    groupValue = Addresses[0].sId ?? "";
  }

  void onSelect(String selectedId) {
    setState(() {
      groupValue = selectedId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.screenHight! * 0.4,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.deliveryAddress, style: AppTextStyle.medium18),
          Expanded(
            child: ListView.builder(
              itemCount: Addresses.length ?? 0,
              itemBuilder: (context, index) {
                final address = Addresses[index];
                return AddressCard(
                  radioValue: address.sId ?? "",
                  groupValue: groupValue ?? "",
                  address: address,
                  onSelect: () => onSelect(address.sId ?? ""),
                );
              },
            ),
          ),
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
}
