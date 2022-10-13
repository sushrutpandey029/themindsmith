import 'package:doctor_app/constants/url_constant.dart';
import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/ui/screens/my_wallet_screen.dart';
import 'package:doctor_app/ui/screens/payout_history_screen.dart';
import 'package:doctor_app/ui/screens/transaction_history_screen.dart';
import 'package:doctor_app/ui/screens/withdraw_history_screen.dart';
import 'package:doctor_app/ui/widgets/comman/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    DoctorModel doctorModel =
        Provider.of<AuthProvider>(context, listen: false).doctorModel!;
    return Scaffold(
      appBar: customAppBar(
        context,
        "About Me",
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
                      "$imgUrl/${doctorModel.doctorImage}",
                      errorBuilder: ((context, error, stackTrace) =>
                          Image.asset('assets/images/user2.png')),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(doctorModel.doctorName,style: text2,),
                  // ),
                  // Text('click to change profile image')
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 8,
                    margin: EdgeInsets.all(12),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text(doctorModel.doctorName),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 8,
                    margin: EdgeInsets.all(12),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text(doctorModel.doctorQualification),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 8,
                    margin: EdgeInsets.all(12),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text(
                          "${doctorModel.doctorExperience} Years in ${doctorModel.doctorSpeciality}"),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 8,
                    margin: EdgeInsets.all(12),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text("languages"),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 8,
                    margin: EdgeInsets.all(12),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text("short bio"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
