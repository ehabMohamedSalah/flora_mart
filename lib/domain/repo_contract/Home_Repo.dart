// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/Home/homeResponse.dart';

abstract class HomeRepo {
  Future<ApiResult<HomeResponse>> call();
}
