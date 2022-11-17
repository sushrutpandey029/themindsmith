import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, String? title, {bool isback = true}) {
  return AppBar(
    toolbarHeight: 70,
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Image.asset(
        'assets/images/mindsmith-logo.png',
        width: 30,
      ),
    ),
    title: title == null ? null : Text(title),
    actions: [
      isback
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const ImageIcon(
                    AssetImage('assets/icons/previous.png'),
                    size: 30,
                  )),
            )
          : const SizedBox(),
    ],
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    // elevation: 0,
  );
}
