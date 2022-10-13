import 'package:doctor_app/ui/screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/notification_provider.dart';
import '../widgets/comman/app_bar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Settings",
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Card(
                    margin: EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text('Themes'),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: () async {
                        await Provider.of<NotificationProvider>(context,
                                listen: false)
                            .fetchNotification(context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text('Notification'),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const AboutScreen())));
                      }),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text('About'),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Material(
                  //     elevation: 2,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(15.0),
                  //     ),
                  //     child: ListTile(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //       ),
                  //       title: Text('Help and Support'),
                  //     ),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
