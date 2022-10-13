

import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/text_style.dart';

void errorDialogue ({required BuildContext context,required String title, String? message,Widget? route}) {
  showDialog(
          context: context,
          builder: (context) => AlertDialog(
                // title: Text(title),
                contentPadding: EdgeInsets.all(30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                elevation: 5,
                content: Text(message ?? 'error: bad state',style:heading3,textAlign: TextAlign.center,),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  ElevatedButton(
                    style: smallBlackButtonStyle,
                      onPressed: () {
                        Navigator.pop(context);
                        if(route!=null) {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => route)));
                        }
                      },
                      child: Text('OK'))
                ],
              ));
}