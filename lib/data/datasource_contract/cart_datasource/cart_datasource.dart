import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';

abstract class CartDatasource {
  Future<ApiResult<dynamic>> addToCart(
      {required String productId, required int quantity});
  Future<ApiResult<CartResponse>> getCartItems();
  Future<ApiResult<CartResponse>> removeFromCart({required String productId});
  Future<ApiResult<CartResponse>> updateProductQuantity(
      {required String productId, required int quantity});
}
