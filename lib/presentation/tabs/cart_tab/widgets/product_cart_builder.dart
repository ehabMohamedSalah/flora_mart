import 'package:flora_mart/data/model/cart/CartItems.dart';
import 'package:flora_mart/presentation/product_details/product_details_screen.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/widgets/product_cart_widget.dart';
import 'package:flutter/material.dart';

class ProductCartBuilder extends StatelessWidget {
  final List<CartItems> cartItem;
  const ProductCartBuilder({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                          product: cartItem[index].product!.toProducts()),
                    ));
              },
              child: ProductCartWidget(
                onTap: () {},
                price: cartItem[index].price,
                priceAfterDiscount: cartItem[index].product?.priceAfterDiscount,
                imgCover: cartItem[index].product?.imgCover,
                title: cartItem[index].product?.title,
                discription: cartItem[index].product?.description,
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: cartItem.length);
  }
}
