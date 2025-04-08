import 'package:flora_mart/core/resuable_comp/flower_card_resuble/flower_card_builder.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_cubit.dart';
import 'package:flora_mart/presentation/tabs/categories_tab/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {

  final String typeId;
  final String type;

  const ProductScreen({
    super.key,
    required this.typeId,
    required this.type,
  });


  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          switch(state)
          {
            case ProductLoadingState():
              return const Center(child: CircularProgressIndicator());

            case ProductLoadedState():
              return FlowerCardBuilder(products: state.products);

            case ProductErrorState():
              return Center(child: Text(state.message));

            default:
              return const SizedBox();
          }
        }
    );
  }
}


