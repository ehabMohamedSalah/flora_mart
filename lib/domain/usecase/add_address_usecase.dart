import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/address_entity.dart';
import 'package:flora_mart/domain/repo_contract/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddAddressUseCase {
  final AddressRepository _addressRepository;

  AddAddressUseCase(this._addressRepository);

  Future<ApiResult> call({
    required AddressEntity address,
  }) async =>
      await _addressRepository.addAddress(address: address);
}
