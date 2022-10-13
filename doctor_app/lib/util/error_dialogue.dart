import 'package:flutter/material.dart';

import '../constants/button_style.dart';
import '../constants/text_style.dart';

void errorDialogue({required BuildContext context, required String? message}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            // title: Text(title),
            contentPadding: EdgeInsets.all(30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            content: Text(message ?? 'error: bad state', style: heading3),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                  style: smallBlackButtonStyle,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          ));
}
