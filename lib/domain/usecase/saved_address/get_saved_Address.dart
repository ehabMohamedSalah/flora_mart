// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/getSavedAddressResponce.dart';
import 'package:flora_mart/domain/repo_contract/saved_address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSavedAddressUseCase {
  final SavedAddressRepo savedAddressRepo;

  @factoryMethod
  GetSavedAddressUseCase({
    required this.savedAddressRepo,
  });

  Future<ApiResult<GetSavedAddressResponce>> invoke() async {
    final result = await savedAddressRepo.getSavedAddress();
    return result;
  }
}
