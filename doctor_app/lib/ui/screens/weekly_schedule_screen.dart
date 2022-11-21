import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../provider/slot_provider.dart';
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
            view: CalendarView.week,
            dataSource: SlotDataSource(value.slotList),
          ),
        );
      }),
      // Padding(
      //   padding: const EdgeInsets.all(18),
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 48.0),
      //     child: Image.asset('assets/images/weekly-shedule.png'),
      //   ),
      // ),
    );
  }
}
