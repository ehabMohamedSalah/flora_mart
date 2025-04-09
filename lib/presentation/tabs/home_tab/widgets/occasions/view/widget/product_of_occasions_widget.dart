import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view_model/occasions_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/resuable_comp/flower_card_resuble/flower_card.dart';
import '../../../../../../../data/model/products/Products.dart';
import '../../view_model/occasions_cubit.dart';
import '../../view_model/occasions_state.dart';

class ProductsOfOccasionWidget extends StatelessWidget {
  final String occasionId; // using lowerCamelCase and final

  const ProductsOfOccasionWidget({
    Key? key,
    required this.occasionId,
  }) : super(key: key);

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
              padding: const EdgeInsets.all(14.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: productsList.length,
                itemBuilder: (BuildContext ctx, int index) {
                  final product = productsList[index];
                  return FlowerCard(
                    onTap: () {
                     },
                    title: product.title,
                    discount: product.discount,
                    imgCover: product.imgCover,
                    price: product.price,
                    priceAfterDiscount: product.priceAfterDiscount,
                  );
                },
              ),
            );
          } else {
            // Optionally handle other states if needed.
            return const SizedBox();
          }
        },
      ),
    );
  }
}
