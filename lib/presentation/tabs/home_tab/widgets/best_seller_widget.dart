import 'package:flora_mart/data/model/Home/BestSeller.dart';
import 'package:flora_mart/presentation/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

import 'image_widget.dart';

class BestSellerWidget extends StatelessWidget {
  BestSeller bestSellerModel;

  BestSellerWidget({required this.bestSellerModel, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var product = bestSellerModel.toProduct(bestSellerModel);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              image: bestSellerModel.images?.first ?? "",
            ),
            Flexible(
              child: Text(
                bestSellerModel.title!.length > 15
                    ? '${bestSellerModel.title?.substring(0, 15)}...'
                    : bestSellerModel.title ?? "",
                softWrap: true,
              ),
            ),
            Flexible(child: Text("${bestSellerModel.price} EGP"))
          ],
        ),
      ),
    );
  }
}
