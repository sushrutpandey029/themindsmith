import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/providers/articles_provider.dart';
import 'package:the_mindsmith/providers/notification_provider.dart';
import 'package:the_mindsmith/providers/prescription_provider.dart';
import 'package:the_mindsmith/ui/screens/resources_screen.dart';
import 'package:the_mindsmith/ui/screens/health_locker_screen.dart';
import 'package:the_mindsmith/ui/screens/notification_screen.dart';
import 'package:the_mindsmith/ui/screens/profile_screen.dart';

import 'customer_support.dart';
import 'home_scren.dart';

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
            contentPadding: const EdgeInsets.all(30),
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
      title: const Text('My Profile'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    AppBar(
      toolbarHeight: 70,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset(
          'assets/images/mindsmith-logo.png',
          width: 30,
        ),
      ),
      title: const Text('All Prescriptions'),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      // elevation: 0,
    ),
    AppBar(
      toolbarHeight: 70,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset(
          'assets/images/mindsmith-logo.png',
          width: 30,
        ),
      ),
      title: const Text('Resources'),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      // elevation: 0,
    ),
  ];
  List<Widget> Elements = [
    const HomePage(),
    const ProfilePage(),
    const HealthLockerPage(),
    const ResourcesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: _selectedIndex == 0
            ? AppBar(
                backgroundColor: Colors.white,
                // elevation: 0,
                toolbarHeight: 70,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    'assets/images/mindsmith-logo.png',
                    width: 30,
                  ),
                ),
                actions: [
                  Consumer<NotificationProvider>(
                      builder: (context, value, widget) {
                    return IconButton(
                      onPressed: () {
                        Provider.of<NotificationProvider>(context,
                                listen: false)
                            .fetchNotification(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationPage()));
                      },
                      icon: Badge(
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
                      ),
                      iconSize: 30,
                      color: Colors.black,
                    );
                  }),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CustomerSport())));
                    },
                    icon: const Icon(Icons.menu),
                    color: Colors.black,
                  ),
                ],
              )
            : appBars.elementAt(_selectedIndex - 1),
        body: Elements.elementAt(_selectedIndex),
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
              // selectedFontSize: 16,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              onTap: (index) {
                if (index == 3) {
                  Provider.of<ArticlesProvider>(context, listen: false)
                      .fetchArticles();
                }
                setState(() {
                  _selectedIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                const BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/home.png')),
                    label: 'Home'),
                const BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/user.png')),
                    label: 'Account'),
                const BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/document.png')),
                    label: 'Health Locker'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.newspaper_outlined), label: 'Resources'),
              ]),
        ),
      ),
    );
  }
}
