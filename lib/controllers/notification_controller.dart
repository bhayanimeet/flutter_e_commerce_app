import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../res/global.dart';

class LocalPushNotificationHelper {
  LocalPushNotificationHelper._();

  static final LocalPushNotificationHelper localPushNotificationHelper =
  LocalPushNotificationHelper._();

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initializeLocalPushNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
    const AndroidInitializationSettings('mipmap/ic_launcher');
    DarwinInitializationSettings darwinInitializationSettings =
    const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showSimpleNotificationForAddToFavorite() async {
    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
      'Favorites',
      'Your selected item added into favorite...',
      priority: Priority.max,
      importance: Importance.max,
    );
    DarwinNotificationDetails darwinNotificationDetails =
    const DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Favorites',
      'Your selected item added into favorite...',
      notificationDetails,
      payload: "Simple notification payload...",
    );
  }

  Future<void> showSimpleNotificationForAddToCart() async {
    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
      'Cart',
      'Your selected item added into cart...',
      priority: Priority.max,
      importance: Importance.max,
    );
    DarwinNotificationDetails darwinNotificationDetails =
    const DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Cart',
      'Your selected item added into cart...',
      notificationDetails,
      payload: "Simple notification payload...",
    );
  }
}
