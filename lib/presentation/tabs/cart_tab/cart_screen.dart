import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_cubit.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/widgets/order_summary_widget.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/widgets/product_cart_builder.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/home_screen_slivers/Address_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      appBar: AppBar(
          forceMaterialTransparency: true,
          title: const Row(
            spacing: 5,
            children: [
              Text("Cart"),
              // Text("(${products.length} items)",
              //     style: const TextStyle(color: Colors.grey)),
            ],
          )),
      body: RefreshIndicator(
        onRefresh: () async => CartCubit.get(context).getCartItems(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const BuildAdress(),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is GetCartItemsSuccessState) {
                      if (state.cartItems.isEmpty) {
                        return const Center(child: Text("Your cart is empty"));
                      }

                      return Expanded(
                        flex: 4,
                        child: ProductCartBuilder(cartItem: state.cartItems),
                      );
                    }
                    if (state is GetCartItemsErrorState) {
                      Center(child: Text(state.message));
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                SizedBox(height: Config.screenHight! * 0.03),
                const Expanded(
                  child: OrderSummaryWidget(subTotal: 0),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text("Checkout",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary))),
                SizedBox(height: Config.screenHight! * 0.03),
              ]),
        ),
      ),
    );
  }
}
