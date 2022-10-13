import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

import '../../models/appointment_notification_model.dart';
import '../../providers/notification_provider.dart';
import '../../util/date_time_helper.dart';

class ConsulationPage extends StatefulWidget {
  const ConsulationPage({ Key? key }) : super(key: key);

  @override
  State<ConsulationPage> createState() => _ConsulationPageState();
}

class _ConsulationPageState extends State<ConsulationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'My Consultations'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Consumer<NotificationProvider>(builder: (context, value, widget) {
        return ListView(
          children: [
            Material(
               elevation:10,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border:  OutlineInputBorder(
                        borderSide: BorderSide(
                          width:2
                        ),
                          borderRadius: BorderRadius.circular(20)),
                          enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(
                          width:2
                        ),
                          borderRadius: BorderRadius.circular(20))),
              ),
            ),
            SizedBox(height:18,),
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
            // for (AllotmentNotificationModel allotmentNotificationModel
            //     in value.allotmentNotificationList)
                for(int i = 0; i<value.allotmentNotificationList.length;i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Card(
                  //  margin: EdgeInsets.all(8),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                  child: ListTile(
                     shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                    tileColor: i==0?Color.fromARGB(255, 141, 190, 231):Colors.transparent,
                      onTap: () {
                        Provider.of<NotificationProvider>(context, listen: false)
                            .selectAllotment(value.allotmentNotificationList.elementAt(i), context);
                      },
                      leading: Icon(Icons.person),
                      title: Text(
                          value.allotmentNotificationList.elementAt(i).doctorName),
                      subtitle:  Text(
                              formateDate1(value.allotmentNotificationList.elementAt(i).appointmentDate)),),
                ),
              ),
           
          ],
        );
      })
      ),
    );
  }
}