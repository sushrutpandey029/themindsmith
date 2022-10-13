import 'package:flutter/material.dart';

import '../widgets/comman/app_bar.dart';

class WeeklySchedulePage extends StatefulWidget {
  WeeklySchedulePage({Key? key}) : super(key: key);

  @override
  State<WeeklySchedulePage> createState() => _WeeklySchedulePageState();
}

class _WeeklySchedulePageState extends State<WeeklySchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,"Weekly Schedule",),
    body: Padding(padding: EdgeInsets.all(18),child: Padding(
      padding: const EdgeInsets.only(top:48.0),
      child: Image.asset('assets/images/weekly-shedule.png'),
    ),),
    );
  }
}