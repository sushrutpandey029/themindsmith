import 'package:doctor_app/provider/slot_provider.dart';
import 'package:doctor_app/util/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentBarWidget extends StatelessWidget {
  const AppointmentBarWidget(
      {Key? key, required this.index, required this.name, required this.time})
      : super(key: key);
  final String time, name;
  final int index;

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
                    color: const Color.fromARGB(255, 23, 119, 198),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(offset: Offset(4, 4), blurRadius: 6)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    formateTime(time),
                    style: const TextStyle(color: Colors.white),
                  ),
                )),
            Container(
              width: 260,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(offset: Offset(4, 4), blurRadius: 6)
                  ],
                  color: Provider.of<SlotProvider>(context, listen: false)
                              .slotList
                              .elementAt(index)
                              .readStatus ==
                          "read"
                      ? const Color.fromARGB(255, 180, 182, 183)
                      : const Color.fromARGB(255, 141, 190, 231),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name),
                    Text(context
                        .read<SlotProvider>()
                        .slotList
                        .elementAt(index)
                        .userRegNo)
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
