import 'package:doctor_app/provider/patient_history_provider.dart';
import 'package:doctor_app/provider/prescription_provider.dart';
import 'package:doctor_app/ui/screens/prescription_listing_screen.dart';
import 'package:doctor_app/ui/widgets/comman/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/slot_provider.dart';

class UserListing extends StatefulWidget {
  const UserListing({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserListing> createState() => _UserListingState();
}

class _UserListingState extends State<UserListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, widget.title),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Consumer<SlotProvider>(builder: ((context, value, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(value: value),
                      );
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
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
                            Provider.of<PatientHistoryProvider>(context,
                                    listen: false)
                                .selectUser(value.userList.elementAt(index));
                            Provider.of<PrescriptionProvider>(context,
                                    listen: false)
                                .selectUser(value.userList.elementAt(index));
                            Provider.of<PrescriptionProvider>(context,
                                    listen: false)
                                .fetchPrescription(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const PrescriptionListingPage(
                                          isHistoryPage: true,
                                        ))));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          title: Text(
                              'User Name: ${value.userList.elementAt(index).userName}'),
                          subtitle: Text(
                              'User Reg No: ${value.userList.elementAt(index).userRegNo}'),
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

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({required this.value});
  final SlotProvider value;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var user in value.userList) {
      if (user.userName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user.userName);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            Provider.of<PatientHistoryProvider>(context, listen: false)
                .selectUser(value.userList.elementAt(index));
            Provider.of<PrescriptionProvider>(context, listen: false)
                .selectUser(value.userList.elementAt(index));
            Provider.of<PrescriptionProvider>(context, listen: false)
                .fetchPrescription(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const PrescriptionListingPage(
                          isHistoryPage: true,
                        ))));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var user in value.userList) {
      if (user.userName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user.userName);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            Provider.of<PatientHistoryProvider>(context, listen: false)
                .selectUser(value.userList.elementAt(index));
            Provider.of<PrescriptionProvider>(context, listen: false)
                .selectUser(value.userList.elementAt(index));
            Provider.of<PrescriptionProvider>(context, listen: false)
                .fetchPrescription(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const PrescriptionListingPage(
                          isHistoryPage: true,
                        ))));
          },
        );
      },
    );
  }
}
