import 'package:flora_mart/core/resuable_comp/flower_card_resuble/flower_card.dart';
import 'package:flora_mart/domain/entity/product_entity.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/categories_screen.dart';
import 'package:flutter/material.dart';

class FlowerCardBuilder extends StatelessWidget {
  final List<ProductEntity> products;
  const FlowerCardBuilder({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.80,
          crossAxisSpacing: 17,
          mainAxisSpacing: 17,
        ),
        itemBuilder: (context, index) => FlowerCard(
          discount: products[index].discount,
          price: products[index].price,
          priceAfterDiscount: products[index].priceAfterDiscount,
          imgCover: products[index].imgCover,
          title: products[index].title,
          onTap: () {},
        ),
        itemCount: products.length,
      ),
    );
  }
}
