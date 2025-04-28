
import 'package:flora_mart/data/model/notifications/notifications.dart';

sealed class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationLoadedState extends NotificationState {
  final List<Notifications> notifications;
  NotificationLoadedState({required this.notifications});
}

class NotificationErrorState extends NotificationState {
  final String message;
  NotificationErrorState({required this.message});
}
