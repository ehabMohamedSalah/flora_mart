import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:flora_mart/domain/repo_contract/tracked_order_repo/tracked_order_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateTrackedOrderUsecase {
  TrackedOrderRepo trackedOrderRepo;
  @factoryMethod
  CreateTrackedOrderUsecase(this.trackedOrderRepo);

  Future<Result<void>> call(OrderTrackerModel orderTrackerModel) {
    return trackedOrderRepo.createTrackedOrder(orderTrackerModel);
  }
}
