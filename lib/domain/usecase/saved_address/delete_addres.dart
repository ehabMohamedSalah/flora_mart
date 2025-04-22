// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/UserModel.dart';
import 'package:flora_mart/domain/repo_contract/saved_address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteSavedAddresUseCase {
  final SavedAddressRepo savedAddressRepo;

  @factoryMethod
  DeleteSavedAddresUseCase({
    required this.savedAddressRepo,
  });

  Future<ApiResult<bool>> invoke({
    required String id,
  }) async {
    final result = await savedAddressRepo.delete(id: id);
    return result;
  }
}
