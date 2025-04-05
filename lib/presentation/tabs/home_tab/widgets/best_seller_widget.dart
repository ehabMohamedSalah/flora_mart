import 'package:flutter/material.dart';
import 'package:flora_mart/data/model/BestSellerModel.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/image_widget.dart';
import 'package:flora_mart/presentation/product_details/product_details_screen.dart';

class BestSellerWidget extends StatelessWidget {
  final BestSellerModel product;

  const BestSellerWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              product: product.toProduct(),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              image: product.imgCover,
            ),
            Text(
              product.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              "${product.price} EGP",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
