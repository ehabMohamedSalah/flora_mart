import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flora_mart/domain/repo_contract/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartItemsUsecase {
  CartRepo cartRepo;
  @factoryMethod
  GetCartItemsUsecase(this.cartRepo);

  Future<ApiResult<CartResponse>> call() async => await cartRepo.getCartItems();
}
