// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flora_mart/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initFCM() async {
    await _firebaseMessaging.requestPermission();

    final token = await _firebaseMessaging.getToken();
    print("Firebase Token: $token");

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');

    const iosInit = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _localNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        handleLocalNotificationTap(details);
      },
    );
  }

  void handleContextListeners(BuildContext context) {
    // Foreground notification
    FirebaseMessaging.onMessage.listen((message) {
      _showLocalNotification(message);
      // Save notification data
    });

    // Background tap
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _showLocalNotification(message);
      handleLocalNotificationTap(NotificationResponse(
        notificationResponseType: NotificationResponseType.selectedNotification,
        payload: message.messageId,
      ));
    });

    // Terminated tap
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _showLocalNotification(message);
        handleLocalNotificationTap(NotificationResponse(
          notificationResponseType:
              NotificationResponseType.selectedNotification,
          payload: message.messageId,
        ));
      }
    });
  }

  void handleLocalNotificationTap(NotificationResponse details) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      Navigator.pushNamed(context, RouteManager.notificationScreen);
    }
  }

  static Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const iosDetails = DarwinNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      notificationDetails,
      payload: message.messageId, // Add payload for identification
    );
  }

  void handleMessage(RemoteMessage? message, BuildContext context) {
    if (message == null) return;

    Navigator.pushNamed(context, RouteManager.notificationScreen);
  }
}
