import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/data/model/products/Products.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/widgets/order_summary_widget.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/widgets/product_cart_builder.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/home_screen_slivers/Address_sliver.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    List<Products> products = [
      //list of products for testing
      Products(
        title: "Wdding Flower",
        imgCover:
            "https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png",
        price: 440,
        priceAfterDiscount: 100,
        discount: 50,
        description: "This is a Pack of White Widding Flowers",
      ),
      Products(
        title: "Red Wdding Flower",
        imgCover:
            "https://flower.elevateegy.com/uploads/5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png",
        price: 440,
        priceAfterDiscount: 100,
        discount: 50,
        description:
            "This is a Pack of Red Widding Flowers 33333333333333333333333333333333333333333adasdadasdadadasdadsadadad",
      ),
      Products(
        title: "Wdding Flower",
        imgCover:
            "https://flower.elevateegy.com/uploads/5165a2c1-3e6c-44db-96f3-97ee83a29da9-cover_image.png",
        price: 440,
        priceAfterDiscount: 100,
        discount: 50,
        description: "This is a Pack of White Widding Flowers",
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
    ];

    return Scaffold(
      appBar: AppBar(
          title: Row(
        spacing: 5,
        children: [
          const Text("Cart"),
          Text("(${products.length} items)",
              style: const TextStyle(color: Colors.grey)),
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const BuildAdress(),
              Expanded(
                flex: 4,
                child: ProductCartBuilder(products: products),
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
    );
  }
}
