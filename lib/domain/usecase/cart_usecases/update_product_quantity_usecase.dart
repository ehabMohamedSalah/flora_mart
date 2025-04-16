import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flora_mart/domain/repo_contract/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProductQuantityUsecase {
  CartRepo cartRepo;
  @factoryMethod
  UpdateProductQuantityUsecase(this.cartRepo);

  Future<ApiResult<CartResponse>> call(
      {required String productId, required int quantity}) async {
    return await cartRepo.updateProductQuantity(
        productId: productId, quantity: quantity);
  }
}
