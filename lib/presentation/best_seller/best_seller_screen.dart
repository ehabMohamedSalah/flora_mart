import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora_mart/core/resuable_comp/flower_card_resuble/flower_card_builder.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_cubit.dart';
import 'package:flora_mart/core/utils/string_manager.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({Key? key}) : super(key: key);

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().doIntent(GetHomeBestSellerIntent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.bestSeller),
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          switch (state) {
            case GetHomeBestSellerLoading():
              return Center(child: CircularProgressIndicator());

            case GetHomeBestSellerSuccess():
              return FlowerCardBuilder(
                products: state.bestSellers.map((e) => e.toProduct()).toList(),
              );

            case GetHomeBestSellerError():
              return Center(
                child: Text(state.message),
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
