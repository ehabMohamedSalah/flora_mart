import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/flower_card_resuble/flower_card.dart';
import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/data/model/products/Products.dart';
import 'package:flora_mart/presentation/product_details/product_details_screen.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowerCardBuilder extends StatelessWidget {
  final List<Products> products;
  const FlowerCardBuilder({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.80,
            crossAxisSpacing: 17,
            mainAxisSpacing: 17,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsScreen(product: products[index]),
                  ));
            },
            child: FlowerCard(
              discount: products[index].discount,
              price: products[index].price,
              priceAfterDiscount: products[index].priceAfterDiscount,
              imgCover: products[index].imgCover,
              title: products[index].title,
              onTap: () {
                CartCubit.get(context).addToCard(
                    productId: products[index].id ?? "", quantity: 1);
                toastMessage(
                    message: AppStrings.addedtocart,
                    tybeMessage: TybeMessage.positive);
              },
            ),
          ),
          itemCount: products.length,
        ),
      ),
    );
  }
}
