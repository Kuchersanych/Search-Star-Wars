import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// Реализация работы с FCM
class FCM {
  static final instance = FCM._();
  FCM._();

  Future<void> initializeApp() async {
    await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await FirebaseMessaging.instance.getToken().then((token) async {
      if (token != null) {
        try {
          print(token);
          /// TODO отправка токена на сервер
        } catch (_) {}
      }
    });
  }

  Future<void> firebaseMessaging() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {}
    });
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
