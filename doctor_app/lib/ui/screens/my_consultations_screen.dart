import 'package:doctor_app/provider/chat_provider.dart';
import 'package:doctor_app/ui/screens/chat_screen.dart';
import 'package:doctor_app/ui/screens/patient_messages_list.dart';
import 'package:doctor_app/ui/screens/user_listing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/slot_provider.dart';
import '../widgets/comman/app_bar.dart';

class ConsulationPage extends StatefulWidget {
  const ConsulationPage({Key? key}) : super(key: key);

  @override
  State<ConsulationPage> createState() => _ConsulationPageState();
}

class _ConsulationPageState extends State<ConsulationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "My Consultations",
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Card(
                    margin: const EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: () {
                        Provider.of<ChatProvider>(context, listen: false)
                            .fetchReceivedChat(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    PatientMessagesListPage())));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: const Text('Check the conversation'),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: () {
                        context.read<SlotProvider>().fetchSlots(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => UserListing(
                                      title: 'Patient History',
                                    ))));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: const Text('Patients History'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
