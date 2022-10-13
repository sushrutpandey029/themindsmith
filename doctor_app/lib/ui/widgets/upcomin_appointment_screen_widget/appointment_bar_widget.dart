import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:doctor_app/ui/screens/patient_details_screen.dart';
import 'package:doctor_app/util/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/slot_model.dart';

class AppointmentBarWidget extends StatelessWidget {
  AppointmentBarWidget(
      {Key? key, required this.index, required this.name, required this.time})
      : super(key: key);
  String time, name;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Provider.of<SlotProvider>(context, listen: false)
              .selectSlot(context, index);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 23, 119, 198),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(offset: Offset(4, 4), blurRadius: 6)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    formateTime(time),
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            Container(
              width: 260,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(offset: Offset(4, 4), blurRadius: 6)],
                  color:Provider.of<SlotProvider>(context, listen: false).slotList.elementAt(index).readStatus=="read"? Color.fromARGB(255, 180, 182, 183): Color.fromARGB(255, 141, 190, 231),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name),
                    Text(context.read<SlotProvider>().slotList.elementAt(index).userRegNo)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
