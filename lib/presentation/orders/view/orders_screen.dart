import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/presentation/orders/view/widget/order_item.dart';
import 'package:flora_mart/presentation/orders/view_model/order_cubit.dart';
import 'package:flora_mart/presentation/orders/view_model/order_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt<OrderCubit>()..doIntent(GetOrderIntent()),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: Text(
                  AppStrings.myOrders,
                  style: AppTextStyle.medium20,
                ),
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                )),
            body: BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                if (state is OrderLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.primary,
                    ),
                  );
                }
                if (state is OrderErrorState) {
                  return Center(child: Text(state.errMessage));
                }

                if (state is OrderSuccessState) {
                  final activeOrders = state.response.orders!
                      .where((order) => order.state == "inProgress")
                      .toList();
                  final completedOrders = state.response.orders!
                      .where((order) => order.state != 'inProgress')
                      .toList();

                  return Padding(
                    padding: REdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TabBar(
                          indicatorColor: ColorManager.addToCartButtonColor,
                          indicatorWeight: 3,
                          labelColor: ColorManager.addToCartButtonColor,
                          labelStyle: AppTextStyle.medium20,
                          tabAlignment: TabAlignment.center,
                          tabs: [
                            Text(AppStrings.active,
                                style: AppTextStyle.medium16),
                            Text(AppStrings.complete,
                                style: AppTextStyle.medium16),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Expanded(
                          child: TabBarView(
                            children: [
                              // Active Orders
                              activeOrders.isNotEmpty
                                  ? ListView.separated(
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

                                        return const SizedBox();
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
                              completedOrders.isNotEmpty
                                  ? ListView.separated(
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

                                        return const SizedBox();
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
                      ],
                    ),
                  );
                }
                return const Text("Something went wrong");
              },
            )),
      ),
    );
  }
}
