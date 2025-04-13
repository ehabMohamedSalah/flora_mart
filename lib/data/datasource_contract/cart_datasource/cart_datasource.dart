import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/cart/CartItems.dart';

abstract class CartDatasource {
  Future<ApiResult<dynamic>> addToCart(
      {required String productId, required int quantity});
  Future<ApiResult<List<CartItems>>> getCartItems();
  Future<ApiResult<dynamic>> removeFromCart({required String productId});
}
