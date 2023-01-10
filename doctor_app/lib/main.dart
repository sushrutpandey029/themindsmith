import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'util/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String? token = await FirebaseMessaging.instance.getToken();

  if (token != null) {
    print(token);
    SharedPref().setToken(token);
    print(await SharedPref().getToken());
  }

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'call_channel',
        channelName: 'Call Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: 'Notification channel for call test',
        locked: true,
      ),
      NotificationChannel(
        channelKey: 'message_channel',
        channelName: 'Message Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: 'Notification channel for message test',
        locked: true,
      ),
    ],
  );
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandler);

  FirebaseMessaging.onMessage.listen(_firebaseMessagingHandler);
  runApp(const MyApp());
}

Future<void> _firebaseMessagingHandler(RemoteMessage message) async {
  print('Handling a message ${message.messageId}');
  AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: message.hashCode,
        channelKey: 'message_channel',
        title: message.notification!.title,
        body: message.notification!.body,
        notificationLayout: NotificationLayout.BigText),
  );

  AwesomeNotifications().createNotification(
    schedule: NotificationCalendar.fromDate(
        date: DateTime.parse(message.data["scheduledDate"]! +
            " " +
            message.data["scheduledTime"]!)),
    content: NotificationContent(
        id: message.hashCode+1,
        channelKey: 'message_channel',
        title: "Join your appointment",
        body:
            "Join Your Appointment with ${message.data["userName"]} at ${message.data["scheduledTime"]}",
        notificationLayout: NotificationLayout.BigText),
  );
}
