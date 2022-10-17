import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/ui/screens/customer_support.dart';
import 'package:doctor_app/ui/screens/faqs_screen.dart';
import 'package:doctor_app/ui/screens/my_consultations_screen.dart';
import 'package:doctor_app/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/url_constant.dart';
import '../widgets/comman/app_bar.dart';
import 'edit_profile_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    DoctorModel doctor = context.read<AuthProvider>().doctorModel!;
    return Scaffold(
      appBar: customAppBar(
        context,
        "My Profile",
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 40,
                    child: Image.network(
                      "$imgUrl/${doctor.doctorImage}",
                      errorBuilder: ((context, error, stackTrace) =>
                          Image.asset('assets/images/user2.png')),
                    ),
                  ),
                  Text(
                    doctor.doctorName,
                    style: text3,
                  ),
                  Text(
                    doctor.doctorQualification,
                    style: text3,
                  )
                ],
              ),
              Column(
                children: [
                  Card(
                    margin: const EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfilePage()));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        title: const Text('Edit Profile'),
                        trailing: const Icon(Icons.arrow_forward_ios)),
                  ),
                  Card(
                    margin: const EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const ConsulationPage())));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: const Text('My Consultations'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const CustomerSupportPage())));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: const Text('Customer Support'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const FaqPage())));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: const Text('FAQ\'S'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SettingPage())));
                      }),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: const Text('Settings'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .logOut(context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: const Text('Log out'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
