import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notificationPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings andriodInit =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initSetting = InitializationSettings(
    android: andriodInit,
  );

  await notificationPlugin.initialize(initSetting);
}

Future<void> showLocalNotification() async {
  const AndroidNotificationDetails andriodDetails = AndroidNotificationDetails(
    'order_channel',
    'Order Confirmation',
    importance: Importance.high,
    priority: Priority.high,
  );

  const NotificationDetails details = NotificationDetails(
    android: andriodDetails,
  );

  await notificationPlugin.show(
    0,
    'Order placed',
    'Your order has been placed successfully ',
    details,
  );
}
