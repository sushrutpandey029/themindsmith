import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/models/notification_model.dart';
import 'package:the_mindsmith/providers/notification_provider.dart';
import 'package:the_mindsmith/ui/screens/notification_details_screen.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

import '../../models/appointment_notification_model.dart';
import '../../util/date_time_helper.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Notification"),
      body: Consumer<NotificationProvider>(builder: (context, value, widget) {
        return Padding(
          padding: EdgeInsets.all(18),
          child: RefreshIndicator(
            onRefresh: ()async {
              value.fetchNotification(context);
            },
            child: ListView(
              children: [
                Material(
                  elevation: 10,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width:2
                          ),
                            borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(
                            width:2
                          ),
                            borderRadius: BorderRadius.circular(20))
                            ),
                  ),
                ),
                if (value.isLoading)
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          )),
                    ),
                  ),
                for (AllotmentNotificationModel allotmentNotificationModel
                    in value.allotmentNotificationList)
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 8,
                    margin: EdgeInsets.all(12),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: allotmentNotificationModel.readStatus == "read"
                          ? Colors.transparent
                          : Color.fromARGB(255, 141, 190, 231),
                      onTap: () {
                        Provider.of<NotificationProvider>(context, listen: false)
                            .selectAllotment(allotmentNotificationModel, context);
                      },
                      leading: Icon(Icons.person),
                      title: Text(
                          allotmentNotificationModel.doctorName),
                      subtitle: Text(
                          formateDate1(allotmentNotificationModel.appointmentDate)),
                    ),
                  ),
                for (NotificationModel notificationModel
                    in value.notificationList)
                  Card(
                    margin: EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: notificationModel.status == "read"
                          ? Colors.transparent
                          : Color.fromARGB(255, 141, 190, 231),
                      onTap: () async {
                        if (notificationModel.status != "read") {
                          await context
                              .read<NotificationProvider>()
                              .updateReadStatusNotification(
                                  notificationModel.notificationId);
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => NotificationDetailsPage(
                                      notificationModel: notificationModel,
                                    ))));
                      },
                      leading: Icon(Icons.person),
                      subtitle: Text(notificationModel.notificationText.length > 14
                          ? '${notificationModel.notificationText.substring(0, 10)}.....'
                          : notificationModel.notificationText),
                     title : Text('Admin Notification'),
                      trailing: Text(formateDate1(notificationModel.date)),
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
