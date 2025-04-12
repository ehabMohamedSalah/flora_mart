// ignore_for_file: file_names

import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/Home/homeResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:flora_mart/domain/repo_contract/Home_Repo.dart';

@injectable
class HomeUsecase {
  final HomeRepo homeRepo;

  @factoryMethod
  HomeUsecase({
    required this.homeRepo,
  });

  Future<ApiResult<HomeResponse>> call() async {
    final result = await homeRepo.call();
    return result;
  }
}
