import 'package:badges/badges.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:doctor_app/ui/screens/appointment_schedule_screen.dart';
import 'package:doctor_app/ui/screens/resources_screen.dart';
import 'package:doctor_app/ui/screens/prescriptions_locker_screen.dart';
import 'package:doctor_app/ui/screens/profile_screen.dart';
import 'package:doctor_app/ui/screens/weekly_schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/chat_provider.dart';
import '../../provider/notification_provider.dart';
import 'e_wallet_screen.dart';
import 'home_screen.dart';

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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            title: Text('Are you sure?'),
            content: Text('Do you want to exit from App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
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
      title: Text('e-Wallet'),
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
      title: Text('Prescription'),
      toolbarHeight: 70,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      // elevation: 0,
    ),
  ];
  List<Widget> Elements = [
    HomePage(),
    EWalletPage(),
    ResourcesPage(),
    PrescriptionLockerPage(),
  ];
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
                      builder: (context,value,widget) {
                        return Badge(
                          elevation: 8,
                          badgeColor: Colors.black,
                          badgeContent: Text(value.unreadNotificationCount.toString(),style: TextStyle(color:Colors.white)),
                          child: Icon(
                            Icons.notifications,
                            size: 30,
                          ),
                        );
                      }
                    ),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ProfilePage())));
                    },
                    icon: ImageIcon(AssetImage('assets/icons/user.png')),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => WeeklySchedulePage())));
                    },
                    icon: ImageIcon(AssetImage('assets/icons/calendar.png')),
                    color: Colors.black,
                  ),
                ],
              )
            : appBars.elementAt(_selectedIndex - 1),
        body: Elements.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
         decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
            ),
          ],),
          child: BottomNavigationBar(
            selectedLabelStyle:TextStyle(fontWeight: FontWeight.bold),
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              onTap: (index) {
                setState(() {
                  if(index==3) {
                     Provider.of<SlotProvider>(context,listen: false).fetchSlots(context);
                  }
                  _selectedIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
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
