import 'package:doctor_app/constants/theme_constant.dart';
import 'package:doctor_app/provider/achievement_provider.dart';
import 'package:doctor_app/provider/articles_provider.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/provider/chat_provider.dart';
import 'package:doctor_app/provider/notification_provider.dart';
import 'package:doctor_app/provider/patient_history_provider.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:doctor_app/provider/video_call_provider.dart';
import 'package:doctor_app/provider/video_link_provider.dart';
import 'package:doctor_app/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/prescription_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => AuthProvider())),
          ChangeNotifierProvider(create: ((context) => NotificationProvider())),
          ChangeNotifierProvider(create: ((context) => VideoLinkProvider())),
          ChangeNotifierProvider(create: ((context) => ArticlesProvider())),
          ChangeNotifierProvider(create: ((context) => AchievementProvider())),
          ChangeNotifierProvider(create: ((context) => SlotProvider())),
          ChangeNotifierProvider(create: ((context) => VideoCallProvider())),
          ChangeNotifierProvider(create: ((context) => ChatProvider())),
          ChangeNotifierProvider(create: ((context) => PrescriptionProvider())),
          ChangeNotifierProvider(
              create: ((context) => PatientHistoryProvider())),
        ],
        child: MaterialApp(
          home: const SplashScreen(),
          theme: lightTheme,
        ));
  }
}
