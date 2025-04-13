import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/repo_contract/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUsecase {
  CartRepo cartRepo;
  AddToCartUsecase(this.cartRepo);
  Future<ApiResult<dynamic>> call(
      {required String productId, required int quantity}) async {
    return await cartRepo.addToCart(productId: productId, quantity: quantity);
  }
}
