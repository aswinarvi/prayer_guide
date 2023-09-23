import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:prayer_guide/services/local_storage.dart';

class NotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    getToken(settings);
  }

  static getToken(NotificationSettings settings) async {
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      debugPrint("permission granted");
      String deviceToken = await messaging.getToken() ?? "NO TOKEN";
      String apnToken = await messaging.getAPNSToken() ?? "NO TOKEN";
      (await LocalStorage.notificationBox)
          .put(StorageKeys.getToken.keys, deviceToken);
      messaging.setForegroundNotificationPresentationOptions(
          alert: true, badge: true, sound: true);
    }
  }

  static foreGroundNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
  }
}
