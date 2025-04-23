import 'package:dio/dio.dart';
import 'package:flora_mart/data/model/address_model.dart';

abstract class AddressDataSource {
  Future<Response> updateAddress({
    required String addressId,
    required AddressModel address,
  });

  Future<Response> addAddress({
    required AddressModel address,
  });
}
