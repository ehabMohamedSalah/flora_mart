import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/cart_datasource/cart_datasource.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:flora_mart/domain/repo_contract/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  CartDatasource cartDatasource;
  @factoryMethod
  CartRepoImpl(this.cartDatasource);

  @override
  Future<ApiResult> addToCart(
      {required String productId, required int quantity}) async {
    return await cartDatasource.addToCart(
        productId: productId, quantity: quantity);
  }

  @override
  Future<ApiResult<CartResponse>> getCartItems() async {
    return await cartDatasource.getCartItems();
  }

  @override
  Future<ApiResult<CartResponse>> removeFromCart(
      {required String productId}) async {
    return await cartDatasource.removeFromCart(productId: productId);
  }

  @override
  Future<ApiResult<CartResponse>> updateProductQuantity(
      {required String productId, required int quantity}) async {
    return await cartDatasource.updateProductQuantity(
        productId: productId, quantity: quantity);
  }
}
