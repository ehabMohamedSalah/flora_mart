import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora_mart/core/resuable_comp/flower_card_resuble/flower_card_builder.dart';
import 'package:flora_mart/presentation/best_seller/view_model/cubit/best_seller_cubit.dart';
import 'package:flora_mart/presentation/best_seller/view_model/cubit/best_seller_intent.dart';
import 'package:flora_mart/core/utils/string_manager.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BestSellerCubit>().doIntent(GetBestSellersIntent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.bestSeller),
      ),
      body: BlocBuilder<BestSellerCubit, BestSellerStates>(
        builder: (context, state) {
          switch (state) {
            case GetBestSellersLoading():
              return const Center(child: CircularProgressIndicator());

            case GetBestSellersSuccess():
              return FlowerCardBuilder(
                products: state.bestSellers.map((e) => e.toProduct()).toList(),
              );

            case GetBestSellersError():
              return Center(
                child: Text(state.message),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
