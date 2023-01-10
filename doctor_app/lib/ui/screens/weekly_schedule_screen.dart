import 'package:doctor_app/model/slot_model.dart';
import 'package:doctor_app/ui/widgets/weekly_shedule_screen_widgets/add_slot_pop_up_widdget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../provider/slot_provider.dart';
import '../../util/error_dialogue.dart';
import '../widgets/comman/app_bar.dart';

class WeeklySchedulePage extends StatefulWidget {
  const WeeklySchedulePage({Key? key}) : super(key: key);

  @override
  State<WeeklySchedulePage> createState() => _WeeklySchedulePageState();
}

class _WeeklySchedulePageState extends State<WeeklySchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          context,
          "Weekly Schedule",
        ),
        body: Consumer<SlotProvider>(builder: (context, value, widget) {
          return Center(
            child: SfCalendar(
              initialDisplayDate: DateTime.now(),
              timeSlotViewSettings: TimeSlotViewSettings(
                timeInterval: const Duration(minutes: 15),
               timeFormat: 'hh:mm a',
              ),
              view: CalendarView.week,
              dataSource: SlotDataSource(value.slotList),
              onTap: (calendarTapDetails) {
                if(calendarTapDetails.date!.millisecondsSinceEpoch < DateTime.now().millisecondsSinceEpoch) {
                 errorDialogue(
                    context: context,
                    message: "You can't add slot for past date"
                 );
                }else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      if (calendarTapDetails.appointments != null) {
                        SlotModel slotModel = calendarTapDetails.appointments!.first;
                        return AddSlotPopUpWidget(
                          slotModel: slotModel,
                          dateTime: DateTime.parse("${slotModel.scheduleDate.toString().split(" ").first} ${slotModel.startTime}"),
                          startDate: slotModel.scheduleDate.toString().split(" ").first,
                          startTime: slotModel.startTime,
                          endTime: slotModel.endTime,
                          avgTime:  slotModel.avgSlotTiming,
                        );
                      } else {
                        return AddSlotPopUpWidget(
                          dateTime: calendarTapDetails.date!,
                        );
                      }
                    });
                }
              },
            ),
          );
        }));
  }
}
