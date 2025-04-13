import 'package:cached_network_image/cached_network_image.dart';
import 'package:flora_mart/core/utils/assets_manager.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCartWidget extends StatefulWidget {
  final String? title;
  final String? imgCover;
  final String? discription;
  final num? price;
  final num? priceAfterDiscount;
  final VoidCallback onTap;
  const ProductCartWidget(
      {super.key,
      this.title,
      this.imgCover,
      this.price,
      this.priceAfterDiscount,
      required this.onTap,
      this.discription});

  @override
  State<ProductCartWidget> createState() => _ProductCartWidgetState();
}

class _ProductCartWidgetState extends State<ProductCartWidget> {
  late num unitPrice;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    unitPrice = widget.priceAfterDiscount ?? widget.price ?? 0;
  }

  num get totalPrice => unitPrice * quantity;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorManager.grey,
            width: 1,
          )),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 8,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: widget.imgCover ?? "",
                  fit: BoxFit.cover,
                  // width: Config.screenWidth! * 0.4,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Skeletonizer(
                    enabled: true,
                    child: Container(
                      color: const Color.fromARGB(131, 158, 158, 158),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(AssetsManager.imagesNotFoundImage),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outline_outlined,
                              color: ColorManager.red))
                    ],
                  ),
                  Text(widget.discription ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.grey,
                      )),
                  Row(
                    children: [
                      Text(
                        "EGP $totalPrice ",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                          icon: const Icon(Icons.remove)),
                      Text("$quantity",
                          style: Theme.of(context).textTheme.bodyMedium),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(Icons.add)),
                    ],
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
