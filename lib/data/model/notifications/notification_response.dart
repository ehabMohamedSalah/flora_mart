import 'package:flora_mart/data/model/notifications/notifications.dart';
import 'package:flora_mart/data/model/notifications/metadata.dart';

class NotificationResponse {
  final String message;
  final Metadata metadata;
  final List<Notifications> notifications;

  NotificationResponse({
    required this.message,
    required this.metadata,
    required this.notifications,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      message: json['message'],
      metadata: Metadata.fromJson(json['metadata']),
      notifications: (json['notifications'] as List)
          .map((e) => Notifications.fromJson(e))
          .toList(),
    );
  }
}