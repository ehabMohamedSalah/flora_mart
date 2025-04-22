import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/core/utils/routes_manager.dart';
import 'package:flora_mart/presentation/check_out/view/widgets/its_gift_part/its_gift_widget.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_cubit.dart';
import 'package:flora_mart/presentation/check_out/view_model/check_out_intents.dart';
import 'package:flora_mart/presentation/tabs/cart_tab/widgets/order_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/app_bar_delivery_time_widget.dart';
import 'widgets/delivery_part/delivery_address_widget.dart';
import 'widgets/payment_method_part/payment_method_widget.dart';
import 'widgets/separator.dart';

class CheckOutPage extends StatelessWidget {
  final double subtotal;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CheckOutPage({required this.subtotal, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CheckoutCubit>(),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text(AppStrings.checkout),
          bottom: const AppBarDeliveryTimeWidget(),
        ),
        body: BlocListener<CheckoutCubit, CheckoutStates>(
          listener: (context, state) async {
            final cubit = CheckoutCubit.get(context);
            if (state is CreditCardSuccessState) {
              cubit
                  .doIntent(LaunchPaymentUrl(context: context, url: state.url));
            }
            if (state is CashOnDeliverySuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteManager.mainScreen, (_) => false);
              toastMessage(
                message: AppStrings.yourOrderPlacedSuccessfully,
                tybeMessage: TybeMessage.positive,
              );
            }

            if (state is CreditCardErrorState) {
              toastMessage(
                message: state.message.toString(),
                tybeMessage: TybeMessage.negative,
              );
            }
            if (state is CashOnDeliveryErrorState) {
              toastMessage(
                message: state.message.toString(),
                tybeMessage: TybeMessage.negative,
              );
            }
          },
          child: BlocBuilder<CheckoutCubit, CheckoutStates>(
            builder: (context, state) {
              final cubit = CheckoutCubit.get(context);
              return Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: ListView(
                      children: [
                        const Separator(),
                        const DeliveryAddressWidget(),
                        const Separator(),
                        const PaymentMethodWidget(),
                        const Separator(),
                        if (cubit.selectedPaymentWayId == Constant.creditCard)
                          Form(
                            key: _formKey,
                            child: const Column(
                              children: [
                                ItsGiftWidget(),
                                Separator(),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            OrderSummaryWidget(subTotal: subtotal),
                            ElevatedButton(
                              onPressed: () {
                                cubit.doIntent(PlaceOrderIntent(
                                  formKey: _formKey,
                                  context: context,
                                ));
                              },
                              child: Text(
                                AppStrings.placeOrder,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
