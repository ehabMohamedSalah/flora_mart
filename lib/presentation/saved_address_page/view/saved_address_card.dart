import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/data/model/getSavedAddressResponce.dart';
import 'package:flutter/material.dart';

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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_outlined,
                      )),
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
