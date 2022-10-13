import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/notification_model.dart';
import '../../provider/notification_provider.dart';
import '../widgets/comman/app_bar.dart';
import 'notification_details_screen.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Notification",
      ),
      body: Consumer<NotificationProvider>(builder: (context, value, widget) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: RefreshIndicator(
            onRefresh: ()async{
              value.fetchNotification(context);
            },
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                if (value.isLoading)
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
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
                      tileColor: notificationModel.status == 'read'
                          ? Colors.transparent
                          : Color.fromARGB(255, 141, 190, 231),
                      onTap: (() async {
                        await context
                            .read<NotificationProvider>()
                            .updateReadStatusNotification(
                                notificationModel.notificationId);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => NotificationDetailsPage(
                                      notificationModel: notificationModel,
                                    ))));
                      }),
                      leading: Icon(Icons.person),
                      subtitle: Text(notificationModel.notificationText),
                      title: Text('Admin Notification'),
                      trailing: Text(notificationModel.date),
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
