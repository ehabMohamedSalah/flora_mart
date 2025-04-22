// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/saved_Address_data_source_repo.dart';
import 'package:flora_mart/data/model/getSavedAddressResponce.dart';
import 'package:flora_mart/domain/repo_contract/saved_address_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SavedAddressRepo)
class SavedAddressRepoImpl implements SavedAddressRepo {
  SavedAddressDataSourceRepo savedAddressDataSourceRepoImpl;

  @factoryMethod
  SavedAddressRepoImpl(this.savedAddressDataSourceRepoImpl);

  @override
  Future<ApiResult<bool>> delete({required String id}) async {
    return await savedAddressDataSourceRepoImpl.delete(id: id);
  }

  @override
  Future<ApiResult<GetSavedAddressResponce>> getSavedAddress() async {
    return await savedAddressDataSourceRepoImpl.getSavedAddress();
  }
}
