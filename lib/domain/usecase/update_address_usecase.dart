import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/entity/address_entity.dart';
import 'package:flora_mart/domain/repo_contract/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateAddressUseCase {
  final AddressRepository _repository;

  UpdateAddressUseCase(this._repository);

  Future<ApiResult<void>> call({
    required String addressId,
    required AddressEntity address,
  }) async {
    return await _repository.updateAddress(
      addressId: addressId,
      address: address,
    );
  }
}
