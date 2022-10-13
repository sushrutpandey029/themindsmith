


import 'package:doctor_app/constants/text_style.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
   CustomBox({Key? key,required this.title, required this.value, required this.width}) : super(key: key);
  String title;
  String value;
  double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text(title,style: text3,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 2
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value,style: text3,),
            )),
        ),

      ],
    );
  }
}