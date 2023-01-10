import 'package:doctor_app/model/add_slot_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/button_style.dart';
import '../../../constants/text_style.dart';
import '../../../model/doctor_model.dart';
import '../../../model/slot_model.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/slot_provider.dart';

class AddSlotPopUpWidget extends StatefulWidget {
  AddSlotPopUpWidget(
      {Key? key,
      this.dateTime,
      this.startDate,
      this.startTime,
      this.endTime,
      this.avgTime,
      this.slotModel})
      : super(key: key);
  SlotModel? slotModel;
  DateTime? dateTime;
  String? startDate;
  String? startTime;
  String? endTime;
  String? avgTime;
  @override
  State<AddSlotPopUpWidget> createState() => _AddSlotPopUpWidgetState();
}

class _AddSlotPopUpWidgetState extends State<AddSlotPopUpWidget> {
  List<String> timeSLots = [
    '15 min',
    '30 min',
    '45 min',
    '60 min',
  ];
  String dropdownvalue = '15 min';
  late String date;
  late String startTime;
  late String endTime;
  late DateTime endDateTime;
  late bool isUpdate;
  bool _isLoading = false;

  @override
  void initState() {
    if (widget.startDate != null) {
      isUpdate = true;
      date = widget.startDate!;
      startTime = widget.startTime!;
      endTime = widget.endTime!;
      dropdownvalue = widget.avgTime!;
    } else {
      isUpdate = false;
      startTime =
          "${widget.dateTime!.hour}:${widget.dateTime!.minute}:${widget.dateTime!.second}";
      date =
          "${widget.dateTime!.year}-${widget.dateTime!.month}-${widget.dateTime!.day}";
      int endTimeInt = widget.dateTime!.millisecondsSinceEpoch + 15000 * 60;
      endDateTime = DateTime.fromMillisecondsSinceEpoch(endTimeInt);
      endTime =
          "${endDateTime.hour}:${endDateTime.minute}:${endDateTime.second}";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isUpdate ? "Update Slot" : "Add A Slot"),
      contentPadding: const EdgeInsets.all(30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: _isLoading
            ? Column(
                children: [
                  Text(
                    'Please Wait!!',
                    style: heading3,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CircularProgressIndicator(),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date : $date', style: text5),
                  Text('Start Time : $startTime', style: text5),
                  Text('End Time : $endTime', style: text5),
                  Row(
                    children: [
                      Text('Time Slot : ', style: text5),
                      DropdownButton(
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: timeSLots.map((String timeSlot) {
                          return DropdownMenuItem(
                            value: timeSlot,
                            child: Text(timeSlot),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            int minutes = int.parse(newValue.split(" ").first);
                            int endTimeInt =
                                widget.dateTime!.millisecondsSinceEpoch +
                                    minutes * 60000;
                            endDateTime =
                                DateTime.fromMillisecondsSinceEpoch(endTimeInt);
                            endTime =
                                "${endDateTime.hour}:${endDateTime.minute}:${endDateTime.second}";
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actionsOverflowAlignment: OverflowBarAlignment.center,
      actions: [
        ElevatedButton(
            style: smallBlackButtonStyle,
            onPressed: () async {
              DoctorModel doctor = context.read<AuthProvider>().doctorModel!;
              setState(() {
                _isLoading = true;
              });

              if(isUpdate) {
                widget.slotModel!.endTime = endTime;
                widget.slotModel!.avgSlotTiming = dropdownvalue;
              }


              isUpdate
                  ? await context
                      .read<SlotProvider>()
                      .updateSlot(widget.slotModel!,context)
                  : await context.read<SlotProvider>().addSlot(AddSlotModel(
                      doctorId: doctor.doctorId,
                      doctorsName: doctor.doctorName,
                      scheduleDate: date,
                      startTime: startTime,
                      endTime: endTime,
                      avgSlotTiming: dropdownvalue),context);
              Navigator.pop(context);
            },
            child: Text(isUpdate ? "Update" : 'Add')),
        if (isUpdate)
          ElevatedButton(
              style: smallBlackButtonStyle,
              onPressed: () async {
                 setState(() {
                _isLoading = true;
              });
                await context
                      .read<SlotProvider>()
                      .deleteSlot(widget.slotModel!.id,context);
                Navigator.pop(context);
              },
              child: const Text('Delete')),
        ElevatedButton(
            style: smallBlackButtonStyle,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
      ],
    );
  }
}
