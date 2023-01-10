import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/providers/auth_provider.dart';
import 'package:the_mindsmith/providers/notification_provider.dart';
import 'package:the_mindsmith/ui/screens/consulation_screen.dart';
import 'package:the_mindsmith/ui/screens/order_screen.dart';

import '../../constants/url_constant.dart';
import 'edit_profile_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // print(Provider.of<AuthProvider>(context, listen: false).userResponse!);
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
                  backgroundImage:
                      Provider.of<AuthProvider>(context, listen: false)
                                  .userModel!
                                  .userImage ==
                              ''
                          ? const AssetImage('assets/images/user2.png')
                              as ImageProvider
                          : NetworkImage(
                              '$imgUrl/${Provider.of<AuthProvider>(context, listen: false).userModel!.userImage}',
                            ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Provider.of<AuthProvider>(context, listen: false)
                        .userModel!
                        .userName,
                    style: text2,
                  ),
                ),
                Text(Provider.of<AuthProvider>(context, listen: false)
                    .userModel!
                    .userRegNo)
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfilePage()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: const Text('Edit Profile'),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const OrderPage())));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: const Text('My Orders'),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: ListTile(
                    onTap: () {
                      Provider.of<NotificationProvider>(context, listen: false)
                          .fetchNotification(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ConsulationPage())));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: const Text('My Consultations'),
                    trailing: const Icon(Icons.arrow_forward),
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
                  margin: const EdgeInsets.all(8),
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
                    title: const Text('Log Out'),
                    trailing: const Icon(Icons.arrow_forward),
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
