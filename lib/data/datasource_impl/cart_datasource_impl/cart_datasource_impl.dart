import 'package:flora_mart/core/api/api_excuter.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_contract/cart_datasource/cart_datasource.dart';
import 'package:flora_mart/data/model/cart/CartItems.dart';
import 'package:flora_mart/data/model/cart/cart_response.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Injectable(as: CartDatasource)
class CartDatasourceImpl implements CartDatasource {
  ApiManager apiManager;
  CacheHelper cacheHelper;
  @factoryMethod
  CartDatasourceImpl({required this.apiManager, required this.cacheHelper});

  var logger = Logger();

  @override
  Future<ApiResult> addToCart(
      {required String productId, required int quantity}) {
    return executeApi(() async {
      String token = await cacheHelper.getData<String>(Constant.tokenKey);
      logger.i("token $token");
      var apiResult = await apiManager
          .postRequest(endpoint: EndPoint.cartEndpoint, headers: {
        "Authorization": "Bearer $token"
      }, body: {
        "product": productId,
        "quantity": quantity,
      });
      CartResponse result = CartResponse.fromJson(apiResult.data ?? {});
      logger.i("${result.message}");
      return result;
    });
  }

  @override
  Future<ApiResult<List<CartItems>>> getCartItems() {
    return executeApi(() async {
      String token = await cacheHelper.getData<String>(Constant.tokenKey);
      logger.i("token $token");
      var apiResult = await apiManager.getRequest(
        endpoint: EndPoint.cartEndpoint,
        headers: {"Authorization": "Bearer $token"},
      );
      CartResponse result = CartResponse.fromJson(apiResult.data ?? {});
      List<CartItems> listProdcts = result.cart?.cartItems ?? [];
      logger.i("${result.message}");
      return listProdcts;
    });
  }

  @override
  Future<ApiResult> removeFromCart({required String productId}) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }
}
