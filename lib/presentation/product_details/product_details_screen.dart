import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/dialogs.dart';
import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/data/model/products/Products.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:flora_mart/presentation/product_details/widgets/image_slider_widget.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_cubit.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/view_model/cubit/cart_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Products product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return BlocProvider(
      create: (context) => getIt<CartCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageSliderWidget(images: product.images ?? []),
              Config.spaceSmall,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          "EGP ${product.priceAfterDiscount}",
                          style: AppTextStyle.semiBold20,
                        ),
                        const Spacer(),
                        Text(AppStrings.status, style: AppTextStyle.medium16),
                        Text(
                            product.quantity != 0
                                ? AppStrings.instock
                                : AppStrings.outofstock,
                            style: AppTextStyle.regular14),
                      ],
                    ),
                    SizedBox(height: Config.screenHight! * 0.001),
                    Text(AppStrings.allpricesincludetax,
                        style: AppTextStyle.regular14.copyWith(
                          color: const Color(0xFF535353),
                        )),
                    SizedBox(height: Config.screenHight! * 0.01),
                    Text(product.title ?? '', style: AppTextStyle.medium16),
                    SizedBox(height: Config.screenHight! * 0.03),
                    Text(
                      AppStrings.description,
                      style: AppTextStyle.medium16,
                    ),
                    Text('''${product.description ?? ""} ''',
                        style: AppTextStyle.regular14),
                    SizedBox(height: Config.screenHight! * 0.03),
                    Text(
                      "${AppStrings.rate} (${product.rateCount} ${AppStrings.people}) ",
                      style: AppTextStyle.medium16,
                    ),
                    Text('${product.rateAvg ?? ""}',
                        style: AppTextStyle.regular14),
                    SizedBox(height: Config.screenHight! * 0.03),
                    BlocConsumer<CartCubit, CartState>(
                      listener: (context, state) {
                        if (state is AddToCartSuccessState) {
                          toastMessage(
                              message: AppStrings.addedtocart,
                              tybeMessage: TybeMessage.positive);
                        }
                        if (state is AddToCartErrorState) {
                          toastMessage(
                              message: state.message,
                              tybeMessage: TybeMessage.negative);
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: AuthCubit.get(context).isguest == true
                                ? () => Dialogs.restrictedAccess(
                                    context, () => Navigator.pop(context))
                                : () {
                                    CartCubit.get(context).doIntent(
                                        AddToCartIntent(
                                            productId: product.id ?? "",
                                            quantity: 1));
                                  },
                            child: state is AddToCartLoadingState
                                ? const CircularProgressIndicator()
                                : Text(
                                    AppStrings.addtocart,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                  ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
