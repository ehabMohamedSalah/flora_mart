// ignore_for_file: file_names, camel_case_types
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/Home_Data_Source_Repo.dart';
import 'package:flora_mart/data/model/Home/homeResponse.dart';
import 'package:flora_mart/domain/repo_contract/Home_Repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class homeRepoImpl implements HomeRepo {
  HomeDataSourceRepo homeDataSourceContract;

  @factoryMethod
  homeRepoImpl(this.homeDataSourceContract);

  @override
  Future<ApiResult<HomeResponse>> call() async {
    return homeDataSourceContract.call();
  }
}
