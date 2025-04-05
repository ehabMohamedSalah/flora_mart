import 'package:flora_mart/data/datasource_contract/guest_datasource.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:flora_mart/domain/repo_contract/guest_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GuestRepo)
class GuestRepoImpl extends GuestRepo {
  @factoryMethod
  GuestDatasource datasource;
  GuestRepoImpl(this.datasource);

  @override
  Future<Result<bool>> checkGuest() async {
    return await datasource.checkGuest();
  }

  @override
  Future<bool> changeGuest({required bool isGuest}) {
    return datasource.changeGuest(isGuest: isGuest);
  }
}
