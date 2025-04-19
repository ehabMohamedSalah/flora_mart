import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/data/model/adress.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final Address address;
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
                  Row(
                    children: [
                      Radio(
                        value: radioValue,
                        groupValue: groupValue,
                        activeColor: ColorManager.pinkBase,
                        onChanged: (value) => onSelect(),
                      ),
                      Text(
                        address.username ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      address.street ?? "",
                      style: const TextStyle(
                        fontSize: 14,
                        color: ColorManager.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.mode_edit_outlined,
              size: 20,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
