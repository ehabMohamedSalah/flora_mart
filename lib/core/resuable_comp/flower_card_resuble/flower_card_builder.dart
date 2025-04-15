import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/flower_card_resuble/flower_card.dart';
import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/data/model/products/Products.dart';
import 'package:flora_mart/presentation/product_details/product_details_screen.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_cubit.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowerCardBuilder extends StatelessWidget {
  final List<Products> products;
  const FlowerCardBuilder({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>(),
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddToCartSuccessState) {
            toastMessage(
                message: AppStrings.addedtocart,
                tybeMessage: TybeMessage.positive);
          }
          if (state is AddToCartErrorState) {
            toastMessage(
                message: state.message, tybeMessage: TybeMessage.negative);
          }
        },
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
                  CartCubit.get(context).doIntent(AddToCartIntent(
                      productId: products[index].id ?? "", quantity: 1));
                },
              ),
            ),
            itemCount: products.length,
          ),
        ),
      ),
    );
  }
}
