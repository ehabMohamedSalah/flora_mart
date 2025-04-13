import 'package:flora_mart/data/model/products/Products.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/widgets/product_cart_widget.dart';
import 'package:flutter/material.dart';

class ProductCartBuilder extends StatelessWidget {
  final List<Products> products;
  const ProductCartBuilder({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => ProductCartWidget(
              onTap: () {},
              price: products[index].price,
              priceAfterDiscount: products[index].priceAfterDiscount,
              imgCover: products[index].imgCover,
              title: products[index].title,
              discription: products[index].description,
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: products.length);
  }
}
