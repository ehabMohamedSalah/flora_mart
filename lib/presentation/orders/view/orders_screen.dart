import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/presentation/orders/view/widget/order_item.dart';
import 'package:flora_mart/presentation/orders/view_model/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../core/resuable_comp/custom_tab_bar_widget.dart';
import '../../../core/utils/string_manager.dart';
import '../../../core/utils/text_style_manager.dart';
import '../view_model/order_intent.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: BlocProvider(
          create: (context) {
            final cubit = getIt<OrderCubit>();
            cubit.doIntent(
                GetOrderIntent()); // Fetch orders when the screen is created
            return cubit;
          },
          child: BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              if (state is OrderLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is OrderErrorState) {
                return Center(child: Text(state.errMessage));
              }

              if (state is OrderSuccessState) {
                final activeOrders = state.response!.orders!
                    .where((order) => order!.state == "inProgress")
                    .toList();

                final completedOrders = state.response!.orders!
                    .where((order) => order!.state != 'inProgress')
                    .toList();
                print("active${activeOrders}");
                print("====================");
                print("completedOrders${completedOrders}");
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      AppStrings.myOrders,
                      style: AppTextStyle.medium20,
                    ),
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_outlined, size: 25),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    bottom: TabBar(
                      isScrollable: false,
                      indicatorColor: ColorManager.addToCartButtonColor,
                      indicatorWeight: 3,
                      labelColor: ColorManager.addToCartButtonColor,
                      labelStyle: AppTextStyle.medium20,
                      tabs: [
                        Center(
                            child: Text(
                          AppStrings.active,
                          style: AppTextStyle.medium16,
                        )),
                        Center(
                            child: Text(AppStrings.complete,
                                style: AppTextStyle.medium16)),
                      ],
                    ),
                  ),
                  body: Padding(
                    padding: REdgeInsets.all(25.0),
                    child: TabBarView(
                      children: [
                        // Active Orders
                        activeOrders != null && activeOrders.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final order = activeOrders[index];
                                  final orderItems = order.orderItems;

                                  if (orderItems != null &&
                                      orderItems.isNotEmpty) {
                                    final orderItem = orderItems.first;
                                    final product = orderItem.product;

                                    if (product != null) {
                                      return OrderItem(
                                          order: order, product: product);
                                    }
                                  }

                                  // لو مفيش بيانات كافية، رجّع عنصر فاضي أو Placeholder
                                  return SizedBox();
                                },
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 10.h),
                                itemCount: activeOrders.length,
                              )
                            : Center(
                                child: Text(
                                  AppStrings.noActiveOrder,
                                  style: AppTextStyle.regular25,
                                ),
                              ),

                        // Completed Orders
                        completedOrders != null && completedOrders.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final order = completedOrders[index];
                                  final orderItems = order.orderItems;

                                  if (orderItems != null &&
                                      orderItems.isNotEmpty) {
                                    final orderItem = orderItems.first;
                                    final product = orderItem.product;

                                    if (product != null) {
                                      return OrderItem(
                                          order: order, product: product);
                                    }
                                  }

                                  return SizedBox();
                                },
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 10.h),
                                itemCount: completedOrders.length,
                              )
                            : Center(
                                child: Text(
                                  AppStrings.noCompletedOrder,
                                  style: AppTextStyle.regular25,
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
