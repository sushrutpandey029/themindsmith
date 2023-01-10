import 'package:doctor_app/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/comman/app_bar.dart';

class PatientMessagesListPage extends StatefulWidget {
  const PatientMessagesListPage({Key? key}) : super(key: key);

  @override
  State<PatientMessagesListPage> createState() =>
      _PatientMessagesListPageState();
}

class _PatientMessagesListPageState extends State<PatientMessagesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Chat",
        isback: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Consumer<ChatProvider>(builder: ((context, value, child) {
          return Column(
            children: [
              if (value.isLoading)
                const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                ),
              Flexible(
                child: ListView.builder(
                    itemCount: value.userList.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ListTile(
                          onTap: () {
                            value.selcetUserId(
                                value.userIdList.elementAt(index), context);
                               
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          title: Text(value.userList.elementAt(index).userName),
                        ),
                      );
                    })),
              ),
            ],
          );
        })),
      ),
    );
  }
}
