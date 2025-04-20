import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/di/di.dart';
import '../../view_model/product_cubit.dart';
import '../../view_model/product_intent.dart';

class FilterCustomWidget extends StatefulWidget {

  final ProductCubit productCubit;
  final VoidCallback onFilterApplied; // Callback عند تطبيق الفلتر

  const FilterCustomWidget({
    super.key,
    required this.productCubit,
    required this.onFilterApplied,
  });
  @override
  _FilterCustomWidgetState createState() => _FilterCustomWidgetState();
}

class _FilterCustomWidgetState extends State<FilterCustomWidget> {
  String selectedSort = 'Highest Price';
  double price = 250;


  final sortOptions = [
    'Lowest Price',
    'Highest Price',
    'New',
    'Old',
    'Discount',
  ];

  @override
  Widget build(BuildContext context) {
    final productCubit = getIt<ProductCubit>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sort by",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: ColorManager.primaryColor)),
          SizedBox(height: 16),
          ...sortOptions.map((option) => Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
            child: RadioListTile(
              title:  Text(option),
              value: option,
              groupValue: selectedSort,
              onChanged: (value) {
                setState(() => selectedSort = value.toString());
              },
            ),
          )),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Price",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: ColorManager.primaryColor)),
          ),
          Slider(
            value: price,
            min: 0,
            max: 250,
            divisions: 25,
            label: "\$${price.round()}",
            activeColor: ColorManager.primaryColor,
            onChanged: (value) {
              setState(() => price = value);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("\$0"), Text("\$250")],
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _applyFilters,
            icon: Icon(Icons.tune),
            label: Text("Filter"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: ColorManager.primaryColor,
              foregroundColor: ColorManager.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }
  void _applyFilters() {
    final filterString = "$selectedSort";
    Navigator.pop(context);

    widget.productCubit.doIntent(
      GetProductsBasedOnFilterIntent(filterString),
    );

    widget.onFilterApplied();
  }
}
