import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/get_all_products_datasource.dart';
import 'package:flora_mart/data/model/notifications/notifications.dart';
import 'package:flora_mart/domain/repo_contract/get_all_notifications_repo.dart';
import 'package:injectable/injectable.dart';

import '../datasource_contract/get_all_notifications_datasource.dart';

@Injectable(as: GetAllNotificationsRepo)
class GetAllNotificationsRepoImpl implements GetAllNotificationsRepo {
  final GetAllNotificationsDatasource getAllNotificationsDatasource;

  GetAllNotificationsRepoImpl(this.getAllNotificationsDatasource);

  @override
  Future<ApiResult<List<Notifications>>> getAllNotifications() {
    return getAllNotificationsDatasource.getAllNotifications();
  }
}
