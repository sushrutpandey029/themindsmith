import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:badges/badges.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:doctor_app/ui/screens/resources_screen.dart';
import 'package:doctor_app/ui/screens/prescriptions_locker_screen.dart';
import 'package:doctor_app/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../provider/notification_provider.dart';
import 'e_wallet_screen.dart';
import 'home_screen.dart';
import 'video_consultation_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit from App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  int _selectedIndex = 0;
  List<AppBar> appBars = [
    AppBar(
      toolbarHeight: 70,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset(
          'assets/images/mindsmith-logo.png',
          width: 30,
        ),
      ),
      title: const Text('e-Wallet'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      // elevation: 0,
    ),
    AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset(
          'assets/images/mindsmith-logo.png',
          width: 30,
        ),
      ),
      title: const Text('Resources'),
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      // elevation: 0,
    ),
    AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset(
          'assets/images/mindsmith-logo.png',
          width: 30,
        ),
      ),
      title: const Text('Prescription'),
      toolbarHeight: 70,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      // elevation: 0,
    ),
  ];
  List<Widget> elements = [
    const HomePage(),
    EWalletPage(),
    ResourcesPage(),
    const PrescriptionLockerPage(),
  ];

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Allow Notifications'),
              content:
                  const Text('Our app would like to send you notifications'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Don\'t Allow',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: (receivedAction) async {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const VideoConsultationPage(),
          ),
          (route) => route.isFirst);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: _selectedIndex == 0
            ? AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    'assets/images/mindsmith-logo.png',
                    width: 30,
                  ),
                ),
                backgroundColor: Colors.white,
                toolbarHeight: 70,
                // elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () async {
                      await Provider.of<NotificationProvider>(context,
                              listen: false)
                          .fetchNotification(context);
                    },
                    icon: Consumer<NotificationProvider>(
                        builder: (context, value, widget) {
                      return Badge(
                        elevation: 8,
                        badgeColor: Colors.black,
                        badgeContent: Text(
                            value.unreadNotificationCount.toString(),
                            style: const TextStyle(color: Colors.white)),
                        child: Lottie.network(
                            'https://assets9.lottiefiles.com/private_files/lf30_ggnpo3y5.json',
                            height: 40,
                            fit: BoxFit.fitHeight,
                            animate: true),
                        // const Icon(
                        //   Icons.notifications,
                        //   size: 30,
                        // ),
                      );
                    }),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ProfilePage())));
                    },
                    icon: const ImageIcon(AssetImage('assets/icons/user.png')),
                    color: Colors.black,
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: ((context) =>
                  //                 const WeeklySchedulePage())));
                  //   },
                  //   icon: const ImageIcon(
                  //       AssetImage('assets/icons/calendar.png')),
                  //   color: Colors.black,
                  // ),
                ],
              )
            : appBars.elementAt(_selectedIndex - 1),
        body: elements.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
              ),
            ],
          ),
          child: BottomNavigationBar(
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              onTap: (index) {
                setState(() {
                  if (index == 3) {
                    Provider.of<SlotProvider>(context, listen: false)
                        .fetchSlots(context);
                  }
                  _selectedIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/home.png')),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/wallet.png')),
                    label: 'e-Wallet'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/briefcase.png')),
                    label: 'Resources'),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/document.png')),
                  label: 'Prescription Locker',
                ),
              ]),
        ),
      ),
    );
  }
}
