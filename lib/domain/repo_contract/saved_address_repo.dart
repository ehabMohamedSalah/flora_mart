import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/getSavedAddressResponce.dart';

abstract class SavedAddressRepo {
  Future<ApiResult<bool>> delete({
    required String id,
  });

  Future<ApiResult<GetSavedAddressResponce>> getSavedAddress();
}
