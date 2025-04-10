import 'package:flora_mart/core/resuable_comp/flower_card_resuble/flower_card_builder.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view_model/occasions_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../data/model/products/Products.dart';
import '../../view_model/occasions_cubit.dart';
import '../../view_model/occasions_state.dart';

class ProductsOfOccasionWidget extends StatelessWidget {
  final String occasionId; // using lowerCamelCase and final

  const ProductsOfOccasionWidget({
    super.key,
    required this.occasionId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OccasionsCubit>(
      create: (context) {
        final cubit = getIt<OccasionsCubit>();
         cubit.doIntent(GetProductIntent(typeId: occasionId, type: "occasion"));
        return cubit;
      },
      child: BlocConsumer<OccasionsCubit, OccasionsState>(
        buildWhen: (previous, current) =>
        current is GetProductsSuccess ||
            current is GetProductsError ||
            current is GetProductsLoading,
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is GetProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetProductsError) {
            return Center(child: Text("Error: ${state.messsage}"));
          } else if (state is GetProductsSuccess) {
            final List<Products> productsList = state.products ?? [];

            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlowerCardBuilder(products: productsList));
          } else {
            // Optionally handle other states if needed.
            return const SizedBox();
          }
        },
      ),
    );
  }
}
