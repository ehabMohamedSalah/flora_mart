import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/notifications/notifications.dart';
import 'package:injectable/injectable.dart';

import '../repo_contract/get_all_notifications_repo.dart';

@injectable
class GetAllNotificationsUsecase {
  final GetAllNotificationsRepo getAllNotificationsRepo;

  GetAllNotificationsUsecase(this.getAllNotificationsRepo);

  Future<ApiResult<List<Notifications>>> execute() =>
      getAllNotificationsRepo.getAllNotifications();
}
