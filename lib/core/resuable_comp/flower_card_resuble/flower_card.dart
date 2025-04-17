import 'package:auto_size_text/auto_size_text.dart';
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
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: ColorManager.white70,
                width: 1,
                // strokeAlign: 0.8,
                style: BorderStyle.solid)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 8,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl: imgCover ?? "",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Skeletonizer(
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
              ),
              SizedBox(height: Config.screenHight! * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: Config.screenHight! * 0.005),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // spacing: 5,
                    children: [
                      AutoSizeText(
                        "EGP ${priceAfterDiscount ?? "0"}",
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(width: 5),
                      AutoSizeText(
                        "${price ?? "0"}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(width: 5),
                      AutoSizeText(
                        "${discount ?? "0"}%",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: ColorManager.green),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: ElevatedButton(
                    onPressed: AuthCubit.get(context).isguest == true
                        ? () {
                            Dialogs.restrictedAccess(
                                context, () => Navigator.pop(context));
                          }
                        : onTap,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: Config.screenWidth! * 0.01),
                          AutoSizeText(
                            AppStrings.addtocart,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 10,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
