import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    // Initialize the plugin
    _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {
      // Handle notification response in the foreground
      print("Notification clicked: ${details.payload}");
    }, onDidReceiveBackgroundNotificationResponse: backgroundHandler);
  }

  static Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _notificationsPlugin.show(
      0,
      'title',
      'body',
      platformChannelSpecifics,
    );
  }
}

@pragma(
    'vm:entry-point') // Required to mark this function for background execution
void backgroundHandler(NotificationResponse details) {
  print("Background notification clicked: ${details.payload}");
}
