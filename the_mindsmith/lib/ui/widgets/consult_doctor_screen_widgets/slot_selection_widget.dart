import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/models/doctor_model.dart';
import 'package:the_mindsmith/models/slot_model.dart';
import 'package:the_mindsmith/providers/doctor_provider.dart';
import 'package:the_mindsmith/providers/slot_provider.dart';
import 'package:the_mindsmith/ui/widgets/consult_doctor_screen_widgets/confirm_order_widget.dart';
import 'package:the_mindsmith/util/date_time_helper.dart';

import '../../../constants/button_style.dart';

class ConsultWidget extends StatefulWidget {
  const ConsultWidget({Key? key}) : super(key: key);

  @override
  State<ConsultWidget> createState() => _ConsultWidgetState();
}

class _ConsultWidgetState extends State<ConsultWidget> {
  bool _isConfirmOrderWidget = false;
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    List<SlotModel> slotList = Provider.of<DoctorProvider>(context).slotList;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
      child: Column(
        children: [
          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   child: ElevatedButton(
          //       style: fullButtonStyle,
          //       onPressed: () {},
          //       child: Padding(
          //         padding: const EdgeInsets.all(16.0),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.stretch,
          //           children: [
          //             // const Text(
          //             //   'Consult Online',
          //             //   style: TextStyle(fontSize: 20),
          //             //   textAlign: TextAlign.center,
          //             // ),
          //           ],
          //         ),
          //       )),
          // ),
          _isConfirmOrderWidget
              ? const ConfirmOrderWidget()
              : Consumer<SlotProvider>(
                  builder: (context, value, widget) {
                    return Column(
                      children: [
                        // Container(
                        //   margin: EdgeInsets.only(top: 40),
                        //   width: MediaQuery.of(context).size.width / 2,
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(10),
                        //       boxShadow: [
                        //         BoxShadow(blurRadius: 3, offset: Offset(1, 1))
                        //       ]),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Center(
                        //         child: Text(
                        //       'Today, ${dateTime.day}/${dateTime.month} (${slotList.length} Slots)',
                        //       style: text2,
                        //     )),
                        //   ),
                        // ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
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
                        if (slotList.isEmpty)
                          Text(
                            'No Slot available for now!!',
                            style: text2,
                          ),
                        Wrap(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (SlotModel slotModel in slotList)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    value.selectSlot(slotModel);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: slotModel.slotId ==
                                                value.selectedSlot?.slotId
                                            ? Border.all(width: 2)
                                            : const Border(),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 3,
                                              offset: Offset(1, 1))
                                        ]),
                                    // height: 80,
                                    width: 150,
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            formateDate(slotModel.scheduleDate),
                                            style: text1,
                                          ),
                                          Text(
                                            formateTime(slotModel.startTime),
                                            style: text2,
                                          ),
                                        ],
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 25,
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
                                Text(
                                  '\u{20B9} ${Provider.of<DoctorProvider>(context).selectedDoctor!.doctorFee}',
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
