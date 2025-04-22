import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/address_entity.dart';

abstract class AddressRepository {
  Future<ApiResult<void>> updateAddress({
    required String addressId,
    required AddressEntity address,
  });

  Future<ApiResult<void>> addAddress({required AddressEntity address});
}
