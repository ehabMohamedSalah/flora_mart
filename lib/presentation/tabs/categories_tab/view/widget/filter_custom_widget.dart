import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/cache/shared_pref.dart';
import '../../../../../core/constant.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../view_model/product_cubit.dart';
import '../../view_model/product_intent.dart';

class FilterCustomWidget extends StatefulWidget {
  final ProductCubit productCubit;
  final VoidCallback onFilterApplied;


  const FilterCustomWidget({
    super.key,
    required this.productCubit,
    required this.onFilterApplied,
  });
  @override
  _FilterCustomWidgetState createState() => _FilterCustomWidgetState();
}

class _FilterCustomWidgetState extends State<FilterCustomWidget> {

  String selectedSort = AppStrings.lowestPrice;
  final cacheHelper = getIt<CacheHelper>();
  late double highestPrice = 0 ;
  late double lowestPrice = 0 ;
  late double selectedPrice = 0;


  final List<String> sortOptions = [
    AppStrings.lowestPrice,
    AppStrings.highestPrice,
    AppStrings.newProducts,
    AppStrings.oldProducts,
    AppStrings.discount,
  ];

  @override
  void initState() {
    super.initState();
    getMaxPrice();
    getMinPrice();
  }

  void getMaxPrice() async {
    int highestPriceInt = await cacheHelper.getData(Constant.highestPrice);
    setState(() {
      highestPrice = highestPriceInt.toDouble();
      selectedPrice = highestPrice;
    });
    print("highestPrice : ${highestPrice}");
  }

  void getMinPrice() async {
    int lowestPriceInt = await cacheHelper.getData(Constant.lowestPrice);
    setState(() {
      lowestPrice = lowestPriceInt.toDouble();
    });
    print("lowestPrice : ${lowestPrice}");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.sortBy,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primaryColor)),
          SizedBox(height: 16),
          ...sortOptions.map((option) => Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: RadioListTile(
              title: Text(option),
              value: option,
              groupValue: selectedSort,
              onChanged: (value) {
                setState(() => selectedSort = value.toString());
              },
            ),
          )),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(AppStrings.price,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.primaryColor)),
          ),
          Slider(
            value: selectedPrice,
            min: lowestPrice,
            max: highestPrice,
            divisions: 25,
            label: "\$${selectedPrice.round()}",
            activeColor: ColorManager.primaryColor,
            onChanged: (value) {
              setState(() => selectedPrice = value);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("$lowestPrice"), Text("${selectedPrice.toStringAsFixed(2)}")],
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _applyFilters,
            icon: Icon(Icons.tune),
            label: Text(AppStrings.filter),
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
