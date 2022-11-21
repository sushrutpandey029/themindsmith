import 'package:doctor_app/provider/prescription_provider.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'prescription_genration_screen.dart';

class PrescriptionLockerPage extends StatefulWidget {
  const PrescriptionLockerPage({Key? key}) : super(key: key);

  @override
  State<PrescriptionLockerPage> createState() => _PrescriptionLockerPageState();
}

class _PrescriptionLockerPageState extends State<PrescriptionLockerPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                          Provider.of<PrescriptionProvider>(context,
                                  listen: false)
                              .selectUser(value.userList.elementAt(index));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const PrescriptionGenrationPage())));
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
            Provider.of<PrescriptionProvider>(context, listen: false)
                .selectUser(value.userList.elementAt(index));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const PrescriptionGenrationPage())));
          },
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
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
            Provider.of<PrescriptionProvider>(context, listen: false)
                .selectUser(value.userList.elementAt(index));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const PrescriptionGenrationPage())));
          },
        );
      },
    );
  }
}
