import 'package:flora_mart/core/api/api_excuter.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/address_datasource.dart';
import 'package:flora_mart/data/model/address_model.dart';
import 'package:flora_mart/domain/entity/address_entity.dart';
import 'package:flora_mart/domain/repo_contract/address_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressRepository)
class AddressRepositoryImpl implements AddressRepository {
  final AddressDataSource _dataSource;

  AddressRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<void>> updateAddress({
    required String addressId,
    required AddressEntity address,
  }) async {
    return await executeApi(() async {
      final addressModel = AddressModel(
        id: address.id ?? '',
        street: address.street,
        phone: address.phone,
        city: address.city,
        lat: address.lat,
        long: address.long,
        username: address.username,
      );

      await _dataSource.updateAddress(
        addressId: addressId,
        address: addressModel,
      );
    });
  }

  @override
  Future<ApiResult<void>> addAddress({required AddressEntity address}) {
    return executeApi(() async {
      final addressModel = AddressModel(
        id: address.id ?? '',
        street: address.street,
        phone: address.phone,
        city: address.city,
        lat: address.lat,
        long: address.long,
        username: address.username,
      );

      await _dataSource.addAddress(address: addressModel);
    });
  }
}
