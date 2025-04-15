import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flora_mart/presentation/product_details/product_details_screen.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_cubit.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/widgets/product_cart_widget.dart';
import 'package:flutter/material.dart';

class ProductCartBuilder extends StatelessWidget {
  final CartResponse cartResponse;
  const ProductCartBuilder({super.key, required this.cartResponse});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                          product: cartResponse.cart?.cartItems?[index].product
                                  ?.toProducts() ??
                              []),
                    ));
              },
              child: ProductCartWidget(
                onTapDeleted: () {
                  CartCubit.get(context).removeFromCart(
                      productId:
                          cartResponse.cart?.cartItems?[index].product?.id ??
                              "");
                },
                price: cartResponse.cart?.cartItems?[index].price ?? 0,
                quantity: cartResponse.cart?.cartItems?[index].quantity ?? 0,
                productId:
                    cartResponse.cart?.cartItems?[index].product?.id ?? "",
                priceAfterDiscount: cartResponse
                        .cart?.cartItems?[index].product?.priceAfterDiscount ??
                    0,
                imgCover:
                    cartResponse.cart?.cartItems?[index].product?.imgCover ??
                        "",
                title:
                    cartResponse.cart?.cartItems?[index].product?.title ?? "",
                discription:
                    cartResponse.cart?.cartItems?[index].product?.description ??
                        "",
                onUpdateQuantity: (String productId, num quantity) {
                  CartCubit.get(context).updateProductQuantity(
                    productId: productId,
                    quantity: quantity.toInt(),
                  );
                  toastMessage(
                      message: "Quantity updated",
                      tybeMessage: TybeMessage.positive);
                },
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: cartResponse.cart?.cartItems?.length ?? 0);
  }
}
