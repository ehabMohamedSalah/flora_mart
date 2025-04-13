import 'package:flora_mart/core/api/api_result.dart';

abstract class CartRepo {
  Future<ApiResult<dynamic>> addToCart(
      {required String productId, required int quantity});
  Future<ApiResult<dynamic>> getCartItems();
  Future<ApiResult<dynamic>> removeFromCart({required String productId});
}
