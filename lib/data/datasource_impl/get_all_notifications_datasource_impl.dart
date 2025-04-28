// ignore_for_file: implementation_imports

import 'package:dio/src/response.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/notifications/notifications.dart';
import 'package:injectable/injectable.dart';
import '../../core/api/api_excuter.dart';
import '../../core/api/api_manager.dart';
import '../../core/api/endpoints.dart';
import '../../core/cache/shared_pref.dart';
import '../../core/constant.dart';
import '../datasource_contract/get_all_notifications_datasource.dart';
import '../model/products/Products.dart';

@Injectable(as: GetAllNotificationsDatasource)
class GetAllNotificationsDatasourceImpl implements GetAllNotificationsDatasource {
  final ApiManager apiManager;
  final CacheHelper cacheHelper;

  GetAllNotificationsDatasourceImpl(this.apiManager,this.cacheHelper);

  @override
  Future<ApiResult<List<Notifications>>> getAllNotifications() async {

    String token = await cacheHelper.getData<String>(Constant.tokenKey);

    return await executeApi<List<Notifications>>(() async {
      Response response;
        response = await apiManager.getRequest(
            endpoint: EndPoint.getAllProductsEndpoint,
            headers: {"Authorization": "$token"},
            queryParameters: {"sort": "-createdAt"});


      final notifications = response.data['notifications'] as List;
      return notifications.map((e) => Notifications.fromJson(e)).toList();
    });
  }
}
