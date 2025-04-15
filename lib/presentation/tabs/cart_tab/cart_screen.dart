import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/data/model/cart/Cart.dart';
import 'package:flora_mart/data/model/cart/CartItems.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_intent.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_cubit.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_intent.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/widgets/order_summary_widget.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/widgets/product_cart_builder.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/home_screen_slivers/Address_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    AuthCubit.get(context).doIntent(CheckGuestIntent());

    return Scaffold(
        appBar: AppBar(
            forceMaterialTransparency: true,
            title: Row(
              spacing: 5,
              children: [
                Text(AppStrings.cart),
                BlocBuilder<CartCubit, CartState>(
                  buildWhen: (previous, current) =>
                      current is GetCartItemsSuccessState,
                  builder: (context, state) {
                    final count = CartCubit.get(context).productCount;
                    return Text("(${(count).toString()} ${AppStrings.items})",
                        style: const TextStyle(color: Colors.grey));
                  },
                ),
              ],
            )),
        body: RefreshIndicator(
          onRefresh: () async =>
              CartCubit.get(context).doIntent(GetCartItemsIntent()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const BuildAdress(),
                const SizedBox(height: 10),

                /// BlocBuilder لمحتوى السلة بالكامل (المنتجات + OrderSummary)
                Expanded(
                  flex: 4,
                  child: BlocBuilder<CartCubit, CartState>(
                    buildWhen: (previous, current) =>
                        current is GetCartItemsSuccessState ||
                        current is GetCartItemsErrorState ||
                        current is GetCartItemsLoadingState,
                    builder: (context, state) {
                      if (state is GetCartItemsSuccessState) {
                        final cartItems = state.cartItems.cart?.cartItems ?? [];
                        if (cartItems.isEmpty) {
                          return Center(
                            child: Text(
                              AppStrings.cartIsempty,
                              style: AppTextStyle.regular25,
                            ),
                          );
                        }

                        // // ✅ احسب subtotal هنا
                        // final double subtotal = cartItems.fold(
                        //   0,
                        //   (total, item) =>
                        //       total +
                        //       (item.product?.price ?? 0) * (item.quantity ?? 1),
                        // );

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                                child: ProductCartBuilder(
                                    cartResponse: state.cartItems)),
                            const SizedBox(height: 20),
                            OrderSummaryWidget(
                                subTotal: (state.cartItems.cart
                                            ?.totalPriceAfterDiscount ??
                                        0)
                                    .toDouble()),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                AppStrings.checkout,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      }

                      if (state is GetCartItemsErrorState) {
                        return Center(child: Text(state.message));
                      }

                      // في حالة التحميل (Skeleton)
                      return Skeletonizer(
                        enabled: true,
                        child: Column(
                          children: [
                            Expanded(
                              child: ProductCartBuilder(
                                cartResponse: CartResponse(
                                    cart: Cart(
                                        cartItems: List.generate(
                                            3, (_) => CartItems()))),
                                // List.generate(3, (_) => CartItems()),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const OrderSummaryWidget(subTotal: 0),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(AppStrings.checkout),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
