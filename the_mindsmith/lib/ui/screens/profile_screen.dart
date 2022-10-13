import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/providers/auth_provider.dart';
import 'package:the_mindsmith/providers/notification_provider.dart';
import 'package:the_mindsmith/ui/screens/consulation_screen.dart';
import 'package:the_mindsmith/ui/screens/order_screen.dart';

import 'edit_profile_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Column(
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 40,
                  child: Image.asset('assets/images/user2.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Provider.of<AuthProvider>(context, listen: false)
                        .userResponse!['users']['user_name'],
                    style: text2,
                  ),
                ),
                Text(Provider.of<AuthProvider>(context, listen: false)
                    .userResponse!['users']['user_reg_no'])
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Card(
                  margin: EdgeInsets.all(8),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: Text('Edit Profile'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                Card(
                   margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => OrderPage())));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: Text('My Orders'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                Card(
                   margin: EdgeInsets.all(8),
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: ListTile(
                    onTap: () {
                      Provider.of<NotificationProvider>(context,
                              listen: false)
                          .fetchNotification(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ConsulationPage())));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: Text('My Consultations'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                //  Padding(
                //    padding: const EdgeInsets.all(8.0),
                //    child: Material(
                //      shape:  RoundedRectangleBorder(

                //                   borderRadius: BorderRadius.circular(15.0),
                //                 ),
                //     elevation: 2,
                //     child: ListTile(
                //       shape: RoundedRectangleBorder(

                //                   borderRadius: BorderRadius.circular(15.0),
                //                 ),
                //       title: Text('Settings'),
                //       trailing: Icon(Icons.arrow_forward),),
                // ),
                //  ),
                Card(
                   margin: EdgeInsets.all(8),
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: ListTile(
                    onTap: () {
                      Provider.of<AuthProvider>(context, listen: false)
                          .signOut(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: Text('Log Out'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
