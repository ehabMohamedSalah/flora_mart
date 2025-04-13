import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/cart_datasource/cart_datasource.dart';
import 'package:flora_mart/domain/repo_contract/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  CartDatasource cartDatasource;
  @factoryMethod
  CartRepoImpl(this.cartDatasource);

  @override
  Future<ApiResult> addToCart(
      {required String productId, required int quantity}) {
    return cartDatasource.addToCart(productId: productId, quantity: quantity);
  }

  @override
  Future<ApiResult> getCartItems() {
    // TODO: implement getCartItems
    throw UnimplementedError();
  }

  @override
  Future<ApiResult> removeFromCart({required String productId}) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }
}
