import 'package:doctor_app/provider/prescription_provider.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:doctor_app/ui/screens/all_prescriptions_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/button_style.dart';
import '../../constants/text_style.dart';
import '../../provider/chat_provider.dart';
import 'new_prescription_screen.dart';
import 'prescription_genration_screen.dart';

class PrescriptionLockerPage extends StatefulWidget {
  const PrescriptionLockerPage({Key? key}) : super(key: key);

  @override
  State<PrescriptionLockerPage> createState() => _PrescriptionLockerPageState();
}

class _PrescriptionLockerPageState extends State<PrescriptionLockerPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Consumer<SlotProvider>(builder: ((context, value, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            if (value.isLoading)
              const Align(
                alignment: Alignment.center,
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
              ),
            Flexible(
              child: ListView.builder(
                  itemCount: value.userList.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        onTap: () {
                          Provider.of<PrescriptionProvider>(context,
                                  listen: false)
                              .selectUser(value.userList.elementAt(index));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      PrescriptionGenrationPage())));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        title: Text(value.userList.elementAt(index).userName),
                      ),
                    );
                  })),
            ),
          ],
        );
      })),
    );
  }
}
