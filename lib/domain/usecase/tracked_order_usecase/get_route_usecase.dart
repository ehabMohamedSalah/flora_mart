import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/repo_contract/tracked_order_repo/tracked_order_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

@injectable
class GetRouteUsecase {
  TrackedOrderRepo trackedOrderRepo;
  @factoryMethod
  GetRouteUsecase(this.trackedOrderRepo);

  Future<ApiResult<List<LatLng>>> call(
      {required LatLng destination, required LatLng start}) {
    return trackedOrderRepo.getRoute(destination: destination, start: start);
  }
}
