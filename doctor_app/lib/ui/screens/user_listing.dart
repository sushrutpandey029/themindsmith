import 'package:doctor_app/provider/patient_history_provider.dart';
import 'package:doctor_app/provider/prescription_provider.dart';
import 'package:doctor_app/ui/screens/patient_history_screen.dart';
import 'package:doctor_app/ui/screens/prescription_listing_screen.dart';
import 'package:doctor_app/ui/widgets/comman/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/slot_provider.dart';

class UserListing extends StatefulWidget {
  UserListing({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  State<UserListing> createState() => _UserListingState();
}

class _UserListingState extends State<UserListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, widget.title),
      body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Consumer<SlotProvider>(builder: ((context, value, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(20))
                      ),
                      
                    ),
              ),
            ),
            if(value.isLoading)
             Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                   
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(color: Colors.black,)),
                ),

            Flexible(
              child: ListView.builder(
                itemCount: value.userList.length,
                itemBuilder: ((context, index) {
                return Card(
                   margin: EdgeInsets.all(12),
                  elevation: 8, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    onTap: () {
                      Provider.of<PatientHistoryProvider>(context,listen: false).selectUser(value.userList.elementAt(index));
                      Provider.of<PrescriptionProvider>(context,listen: false).selectUser(value.userList.elementAt(index));
                      Provider.of<PrescriptionProvider>(context,listen: false).fetchPrescription(context);
                       Navigator.push(context, MaterialPageRoute(builder: ((context) => PrescriptionListingPage(isHistoryPage: true,))));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: Text('User Name: ${value.userList.elementAt(index).userName}'),
                    subtitle: Text('User Reg No: ${value.userList.elementAt(index).userRegNo}'),
                  ),
                );
              })),
            ),
          ],
        );
        
      })),
    ),
    );
  }
}