import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:prayer_guide/models/prayer/content.dart';
import 'package:prayer_guide/pages/pages.dart';
import 'package:prayer_guide/services/local_storage.dart';
import 'package:prayer_guide/services/notifications.dart';
import 'package:prayer_guide/services/services.dart';
import 'package:prayer_guide/styles/route.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  debugPrint("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await initialiseLocalStorage();
  NotificationService.foreGroundNotification();

  Prayer.downloadPrayerGuide();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // statusBarColor: AppColors.secondaryAppColor,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prayer Guide',
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      home: StartingPage(),
    );
  }
}

// ignore: must_be_immutable
class StartingPage extends StatelessWidget {
  StartingPage({Key? key}) : super(key: key);
  requestNotification() async {
    String token = (await LocalStorage.notificationBox).get(StorageKeys.getToken.keys) ?? "NO TOKEN";
    debugPrint(token);
    if (token == "NO TOKEN") {
      debugPrint("requesting notification permission");
      NotificationService.requestNotificationPermission();
    }
  }

  Box<PrayerContent>? prayerContent;
  initPrayer() async {
    prayerContent = await LocalStorage.contentBox;
  }

  @override
  Widget build(BuildContext context) {
    initPrayer();
    requestNotification();
    Future.delayed(const Duration(milliseconds: 1000), () {
      return Navigator.pushReplacement(
          context,
          FadePageRoute(
              HomePage(
                content: prayerContent!,
              ),
              1500));
    });
    return const SplashPage();
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
