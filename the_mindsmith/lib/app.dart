import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/theme_constant.dart';
import 'package:the_mindsmith/providers/articles_provider.dart';
import 'package:the_mindsmith/providers/auth_provider.dart';
import 'package:the_mindsmith/providers/doctor_provider.dart';
import 'package:the_mindsmith/providers/notification_provider.dart';
import 'package:the_mindsmith/providers/prescription_provider.dart';
import 'package:the_mindsmith/providers/slot_provider.dart';
import 'package:the_mindsmith/providers/video_call_provider.dart';
import 'package:the_mindsmith/ui/screens/splash_screen.dart';

import 'providers/chat_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => DoctorProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => ArticlesProvider()),
        ChangeNotifierProvider(create: (context) => SlotProvider()),
        ChangeNotifierProvider(create: (context) => PrescriptionProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => VideoCallProvider()),
      ],
      child: MaterialApp(
        home: const SplashScreen(),
        theme: lightTheme,
      ),
    );
  }
}
