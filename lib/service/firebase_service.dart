import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseServiceProvider = Provider<FirebaseMessageService>((ref) {
  return FirebaseMessageService();
});

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void _handleMessage(RemoteMessage message) {
  if (message.notification!=null) {
    NotificationService.showNotification(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title: message.notification?.title ?? "No Title",
      body: message.notification?.body ?? "No Body",
    );
  }
}

class FirebaseMessageService {
  static Future<void> initialize() async {

    await Firebase.initializeApp();

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    await NotificationService.initialize();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage
    message) async {
      print("Notification received in foreground:");
      print("Title: ${message.notification?.title}");
      print("Body: ${message.notification?.body}");
       _handleMessage(message);
    });
  }

  Future<String?> getFcmToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      print(token);
      return token;
    } catch (e) {
      print("Error getting FCM token: $e");
      return null;
    }
  }
}

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    final DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(iOS: iosSettings);

    await _notificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        sound: 'siren-alert-96052.wav');
    const NotificationDetails notificationDetails =
        NotificationDetails(iOS: iosDetails);

    await _notificationsPlugin.show(id, title, body, notificationDetails);
  }
}
