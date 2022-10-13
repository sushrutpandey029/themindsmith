import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_mindsmith/util/initial_auth_check.dart';

import '../../constants/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Timer(
          const Duration(seconds: 6),
          () =>authHandler(context));
    });
  }

  Offset _offset = Offset(0, 3);
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    
   Future.microtask(() {
      Timer(Duration(seconds: 2), () {
      setState(() {
        _offset = Offset.zero;
        _isVisible = true;
      });
    });
   },);
    return Scaffold(
      body: Center(
        child: Column(

          children: [
            SizedBox(height: MediaQuery.of(context).size.height/3,),
           Image.asset('assets/images/mindsmith-logo.png',width: 180,),
            SizedBox(
              height: 15,
            ),
            AnimatedSlide(
                offset: _offset,
                duration: Duration(seconds: 1),
                child: _isVisible
                    ? Text(
                        'WELCOME TO HEALTHY LIFE',
                        style: splashHeading,
                      )
                    : null)
          ],
        ),
      ),
    );
  }
}
