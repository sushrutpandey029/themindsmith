import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/models/user_model.dart';
import 'package:the_mindsmith/providers/auth_provider.dart';
import 'package:the_mindsmith/ui/screens/wrapper.dart';
import 'package:the_mindsmith/util/shared_pref.dart';

import '../providers/notification_provider.dart';
import '../ui/screens/login_screen.dart';

Future<void> authHandler(BuildContext context) async {
  // FirebaseAuth.instance.currentUser ==null
  SharedPref pref = SharedPref();
  String? userResponse = await pref.getData();
  
  int? dateTime = await pref.getDate();

  if (userResponse == null || dateTime==null || DateTime.now().millisecondsSinceEpoch-dateTime>864000000) 
  // if(true)
  {
    pref.removeData();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LogInPage()));
  } else
   {
    Provider.of<AuthProvider>(context,listen: false).userModel= userModelFromMap(userResponse) ;
   await  pref.setDate();
     Provider.of<NotificationProvider>(context,listen: false).fetchNotification(context);
          // Provider.of<ArticlesProvider>(context,listen: false).fetchArticles();
    print(userResponse);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Wrapper()));
  }
}
