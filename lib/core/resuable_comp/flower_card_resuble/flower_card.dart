import 'package:cached_network_image/cached_network_image.dart';
import 'package:flora_mart/core/resuable_comp/dialogs.dart';
import 'package:flora_mart/core/utils/assets_manager.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FlowerCard extends StatelessWidget {
  final String? title;
  final String? imgCover;
  final num? price;
  final num? priceAfterDiscount;
  final num? discount;
  final VoidCallback onTap;
  const FlowerCard(
      {super.key,
      this.title,
      this.imgCover,
      this.price,
      this.priceAfterDiscount,
      this.discount,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: ColorManager.borderColor,
              width: 1,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 8,
                child: Center(
                    child: CachedNetworkImage(
                  imageUrl: imgCover ?? "",
                  fit: BoxFit.fill,
                  width: double.infinity,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Skeletonizer(
                    enabled: true,
                    child: Container(
                      color: const Color.fromARGB(131, 158, 158, 158),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(AssetsManager.imagesNotFoundImage),
                )),
              ),
              SizedBox(height: Config.screenHight! * 0.01),
              Center(
                child: Text(
                  title ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: Config.screenHight! * 0.005),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // spacing: 5,
                children: [
                  Text(
                    "EGP ${priceAfterDiscount ?? "0"}",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(width: Config.screenWidth! * 0.02),
                  Flexible(
                      child: Text("${price ?? "0"}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ))),
                  SizedBox(width: Config.screenWidth! * 0.02),
                  Flexible(
                      child: Text(
                    "${discount ?? "0"}%",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: ColorManager.green),
                  )),
                ],
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: AuthCubit.get(context).isguest == true
                      ? () {
                          Dialogs.restrictedAccess(
                              context, () => Navigator.pop(context));
                        }
                      : onTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // spacing: 8,
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                      SizedBox(width: Config.screenWidth! * 0.01),
                      Text(
                        AppStrings.addtocart,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
