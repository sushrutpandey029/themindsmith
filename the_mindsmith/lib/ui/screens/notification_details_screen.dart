import 'package:flutter/material.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';
import 'package:the_mindsmith/util/date_time_helper.dart';

import '../../constants/text_style.dart';
import '../../models/notification_model.dart';

class NotificationDetailsPage extends StatefulWidget {
   NotificationDetailsPage({ Key? key ,required this.notificationModel}) : super(key: key);
  NotificationModel notificationModel;

  @override
  State<NotificationDetailsPage> createState() => _NotificationDetailsPageState();
}

class _NotificationDetailsPageState extends State<NotificationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Notificaton'),
      body:  SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical:18,horizontal: 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 SizedBox(height: 80,),
              Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:28.0),
                      child: Text(formateDate(widget.notificationModel.date),style: text2,),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Hi ${widget.notificationModel.userName},',style: heading2,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('This Notification is sent to you by Admin Team.',style: text4,),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.notificationModel.notificationText,style: text5,),
                  ) ,
                  Divider(height: 30,thickness: 2,color: Color.fromARGB(200, 0, 0, 0),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Thanks & Regards',style: text4,),
                  ) ,Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('The MindSmith',style: text4,),
                  ),
                  ],
              ),
            ),),
      )
    );
  }
}