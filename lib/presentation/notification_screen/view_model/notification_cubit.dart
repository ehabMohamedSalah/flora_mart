import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/usecase/get_all_notifications_usecase.dart';
import 'package:flora_mart/presentation/notification_screen/view_model/notification_intent.dart';
import 'package:flora_mart/presentation/notification_screen/view_model/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  @factoryMethod
  final GetAllNotificationsUsecase getAllNotificationsUsecase;

  NotificationCubit(this.getAllNotificationsUsecase)
      : super(NotificationInitial());

  Future<void> _getNotifications() async {
    emit(NotificationLoadingState());
    final result = await getAllNotificationsUsecase.execute();

    switch (result) {
      case SuccessApiResult():
        if (isClosed) return;
        emit(NotificationLoadedState(notifications: result.data ?? []));
      case ErrorApiResult():
        emit(NotificationErrorState(message: result.exception.toString()));
    }
  }

  void doIntent(NotificationIntent intent) {
    switch (intent) {
      case GetNotificationIntent():
        _getNotifications();
        break;
    }
  }
}
