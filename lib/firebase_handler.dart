import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'firebase_default_config.dart';

class FirebaseHandler {
  static Future<void> initialize() async {
    await Firebase.initializeApp(
        options: FirebaseDefaultConfig.platformOptions);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    getToken();

    // 建立 Android 推播頻道
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'in_app_channel', // id
      'App 內推播頻道', // title
      description: 'App 內推播頻道，可在設定頁管理這個頻道處理推播的方式。', // description
      importance: Importance.high,
    );

    // 使用本地推播套件
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // 使 App 在前景執行時能接收推播
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    icon: "launch_background")));
      }
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp(
        options: FirebaseDefaultConfig.platformOptions);
    log('Handling a background message ${message.messageId}',
        name: "FirebaseHandler");
  }

  static getToken() async {
    String fcmToken = await FirebaseMessaging.instance.getToken() ?? "";
    log("FCMToken: $fcmToken", name: "FirebaseHandler");
  }
}
