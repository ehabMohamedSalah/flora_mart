import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/notifications/notifications.dart';


abstract class GetAllNotificationsRepo {
  Future<ApiResult<List<Notifications>>> getAllNotifications();
}
