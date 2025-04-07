import 'package:flora_mart/core/resuable_comp/search_bar/custom_searchbar_widget.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view/widget/tab_categories.dart';
import 'package:flutter/material.dart';
import 'package:flora_mart/core/resuable_comp/flower_card_resuble/flower_card_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Products> products = [
      //list of products for testing
      Products(
        title: "Wdding Flower",
        imgCover:
            "https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png",
        price: 440,
        priceAfterDiscount: 100,
        discount: 50,
      ),
      Products(
        title: "Red Wdding Flower",
        imgCover:
            "https://flower.elevateegy.com/uploads/5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png",
        price: 440,
        priceAfterDiscount: 100,
        discount: 50,
      ),
      Products(
        title: "Wdding Flower",
        imgCover:
            "https://flower.elevateegy.com/uploads/5165a2c1-3e6c-44db-96f3-97ee83a29da9-cover_image.png",
        price: 440,
        priceAfterDiscount: 100,
        discount: 50,
      ),
      Products(
        title: "Wdding Flower",
        imgCover:
            "https://flower.elevateegy.com/uploads/5165a2c1-3e6c-44db-96f3-97ee83a29da9-cover_image.png",
        price: 440,
        priceAfterDiscount: 100,
        discount: 50,
      ),
      Products(
        title: "Wdding Flower",
        imgCover:
            "https://flower.elevateegy.com/uploads/5165a2c1-3e6c-44db-96f3-97ee83a29da9-cover_image.png",
        price: 440,
        priceAfterDiscount: 100,
        discount: 50,
      ),
      Products(
        title: "Wdding Flower",
        imgCover:
            "https://flower.elevateegy.com/uploads/5165a2c1-3e6c-44db-96f3-97ee83a29da9-cover_image.png",
        price: 440,
        priceAfterDiscount: 100,
        discount: 50,
      ),
      Products(
        title: "Wdding Flower",
        imgCover:
            "https://flower.elevateegy.com/uploads/5165a2c1-3e6c-44db-96f3-97ee83a29da9-cover_image.png",
        price: 440,
        priceAfterDiscount: 100,
        discount: 50,
      )
    ];

    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSearchBar(margin: EdgeInsets.zero),
                SizedBox(width: 10.w),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorManager.white70, width: 1),
                  ),
                  child: Icon(Icons.format_align_left,
                      color: ColorManager.white70, size: 24),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(flex:0,child: TabCategories(id: '')),
            Expanded(flex:6,child: FlowerCardBuilder(products: products)),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      onPressed: () {},
      icon: Icon(Icons.tune),
      label: Text(AppStrings.filter),
    );
  }
}

class Products {
  //this is a custom class for testing but the response from api like this
  Products({
    this.title,
    this.price,
    this.priceAfterDiscount,
    this.discount,
    this.imgCover,
  });

  String? title;
  String? imgCover;
  num? price;
  num? priceAfterDiscount;
  num? discount;
}
