import 'package:dio/dio.dart';
import 'package:flora_mart/core/api/api_manager.dart';
import 'package:flora_mart/core/api/endpoints.dart';
import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_contract/address_datasource.dart';
import 'package:flora_mart/data/model/address_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressDataSource)
class AddressDataSourceImpl implements AddressDataSource {
  final ApiManager _apiManager;
  final CacheHelper _cacheHelper;

  AddressDataSourceImpl(this._apiManager, this._cacheHelper);

  @override
  Future<Response> updateAddress({
    required String addressId,
    required AddressModel address,
  }) async {
    print('🚀 Starting updateAddress with addressId: $addressId');
    print('📦 Address data to update: ${address.toJson()}');

    String? token = await _cacheHelper.getData<String>(Constant.tokenKey);
    print(
        '🔑 Token retrieved: ${token != null ? 'Token exists' : 'Token is null'}');

    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    print('📋 Headers prepared: $headers');

    try {
      print('🔄 Making PATCH request to: ${EndPoint.updateAddress}$addressId');
      final response = await _apiManager.patchRequest(
        endpoint: EndPoint.updateAddress(addressId),
        body: address.toJson(),
        headers: headers,
      );
      print('✅ Response received: ${response.statusCode}');
      print('📄 Response data: ${response.data}');
      return response;
    } catch (e) {
      print('❌ Error in updateAddress: $e');
      rethrow;
    }
  }

  @override
  Future<Response> addAddress({required AddressModel address}) async {
    print('🚀 Starting addAddress');
    print('📦 Address data to Add: ${address.toJson()}');
    String? token = await _cacheHelper.getData<String>(Constant.tokenKey);
    print(
        '🔑 Token retrieved: ${token != null ? 'Token exists' : 'Token is null'}');

    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    print('📋 Headers prepared: $headers');

    try {
      print('🔄 Making PATCH request to: ${EndPoint.addAddress}');

      final requestBody = {
        'street': address.street,
        'phone': address.phone,
        'city': address.city,
        'lat': address.lat,
        'long': address.long,
        'username': address.username,
      };

      final response = await _apiManager.patchRequest(
        endpoint: EndPoint.addAddress,
        body: requestBody,
        headers: headers,
      );
      print('✅ Response received: ${response.statusCode}');
      print('📄 Response data: ${response.data}');
      return response;
    } catch (e) {
      print('❌ Error in addAddress: $e'); // Fixed error message
      rethrow;
    }
  }
}
