import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationHelper {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static LocalNotificationHelper _localNotification;

  LocalNotificationHelper._createInstance();
  factory LocalNotificationHelper() {
    if (_localNotification == null) {
      _localNotification = LocalNotificationHelper._createInstance();
      _localNotification._initialize();
    }
    return _localNotification;
  }

  Future _onSelectNotification(String payload) async {
    // Implement your own logic
  }

  Future _onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // Implement your own logic
  }

  Future<void> _initialize() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: _onDidReceiveLocalNotification);

    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: _onSelectNotification);
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    const IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails();
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
        0, 'Notification Title', 'Notification Body', platformChannelSpecifics,
        payload: 'Notification Payload');
  }
}