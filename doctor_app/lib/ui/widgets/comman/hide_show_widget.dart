import 'package:doctor_app/constants/text_style.dart';
import 'package:flutter/material.dart';

class HideShowWidget extends StatefulWidget {
  const HideShowWidget({Key? key, required this.title, required this.data})
      : super(key: key);
  // bool isVisible;
  final String title;
  final String data;

  @override
  State<HideShowWidget> createState() => _HideShowWidgetState();
}

class _HideShowWidgetState extends State<HideShowWidget> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          // margin: const EdgeInsets.all(8),
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
                // print(isVisible);
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Text(
              widget.title,
              style: text2,
            ),
            trailing:
                Icon(isVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down),
          ),
        ),
        if (isVisible)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.data,
              style: text1,
            ),
          )
      ],
    );
  }
}
