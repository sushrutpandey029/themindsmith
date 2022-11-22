import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/models/slot_model.dart';
import 'package:the_mindsmith/providers/doctor_provider.dart';
import 'package:the_mindsmith/providers/slot_provider.dart';
import 'package:the_mindsmith/ui/widgets/consult_doctor_screen_widgets/confirm_order_widget.dart';

import '../../../constants/button_style.dart';

class ConsultWidget extends StatefulWidget {
  const ConsultWidget({
    Key? key,
    required this.isfollowup,
  }) : super(key: key);
  final bool isfollowup;

  @override
  State<ConsultWidget> createState() => _ConsultWidgetState();
}

class _ConsultWidgetState extends State<ConsultWidget> {
  bool _isConfirmOrderWidget = false;
  DateTime dateTime = DateTime.now();
  SlotModel? selectedslot;
  bool isfollowUp = false;

  @override
  void initState() {
    isfollowUp = widget.isfollowup;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SlotModel> slotList = Provider.of<DoctorProvider>(context).slotList;
    if (widget.isfollowup) {
      slotList.removeWhere((element) => element.avgSlotTiming.contains('45'));
    } else {
      slotList.removeWhere((element) => !element.avgSlotTiming.contains('45'));
    }
    String calculateprice(SlotModel slotModel) {
      if (slotModel.avgSlotTiming.contains('15')) {
        return '2500';
      } else if (slotModel.avgSlotTiming.contains('30')) {
        return '5000';
      } else if (slotModel.avgSlotTiming.contains('60')) {
        return '10000';
      }
      return '7500';
    }

    print(isfollowUp);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
      child: Column(
        children: [
          _isConfirmOrderWidget
              ? ConfirmOrderWidget(fee: calculateprice(selectedslot!))
              : Consumer<SlotProvider>(
                  builder: (context, value, widget) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(blurRadius: 3, offset: Offset(1, 1))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              'Select time slot',
                              style: text2,
                            )),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Divider(
                            thickness: 3,
                            color: Colors.black,
                          ),
                        ),
                        if (slotList.isEmpty || !isfollowUp)
                          Text(
                            'No 45 min Slot available for now!!',
                            style: text2,
                          ),

                        SfCalendar(
                          view: CalendarView.week,
                          dataSource: SlotDataSource(slotList),
                          onTap: (calendarTapDetails) {
                            setState(() {
                              selectedslot =
                                  calendarTapDetails.appointments!.first;
                            });
                            if (calendarTapDetails.appointments!.first.status ==
                                'not book') {
                              value.selectSlot(
                                  calendarTapDetails.appointments!.first);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Slot already booked!')));
                            }
                          },
                        ),
                        // Wrap(
                        //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     for (SlotModel slotModel in slotList)
                        //       Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: InkWell(
                        //           onTap: () {
                        //             value.selectSlot(slotModel);
                        //           },
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 border: slotModel.slotId ==
                        //                         value.selectedSlot?.slotId
                        //                     ? Border.all(width: 2)
                        //                     : const Border(),
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 boxShadow: const [
                        //                   BoxShadow(
                        //                       blurRadius: 3,
                        //                       offset: Offset(1, 1))
                        //                 ]),
                        //             // height: 80,
                        //             width: 150,
                        //             child: Center(
                        //                 child: Padding(
                        //               padding: const EdgeInsets.symmetric(
                        //                   vertical: 8.0),
                        //               child: Column(
                        //                 children: [
                        //                   Text(
                        //                     formateDate(slotModel.scheduleDate),
                        //                     style: text1,
                        //                   ),
                        //                   Text(
                        //                     formateTime(slotModel.startTime),
                        //                     style: text2,
                        //                   ),
                        //                 ],
                        //               ),
                        //             )),
                        //           ),
                        //         ),
                        //       ),
                        //   ],
                        // ),
                        const Divider(
                          thickness: 3,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                selectedslot == null
                                    ? Text(
                                        'Please select the slot first',
                                        style: text2,
                                      )
                                    : Text(
                                        '\u{20B9} ${calculateprice(selectedslot!)}',
                                        style: text2,
                                      ),
                                const Text('Online consult fee'),
                              ],
                            ),
                            ElevatedButton(
                                style: smallBlackButtonStyle,
                                onPressed: () {
                                  if (value.selectedSlot != null) {
                                    setState(() {
                                      _isConfirmOrderWidget = true;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('please select a slot')));
                                  }
                                },
                                child: const Text('Continue'))
                          ],
                        )
                      ],
                    );
                  },
                ),
        ],
      ),
    );
  }
}
