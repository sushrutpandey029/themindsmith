import 'package:doctor_app/constants/button_style.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/ui/screens/payout_details_screen.dart';
import 'package:doctor_app/ui/screens/payout_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/text_style.dart';
import '../../constants/url_constant.dart';

class EWalletPage extends StatefulWidget {
  const EWalletPage({Key? key}) : super(key: key);

  @override
  State<EWalletPage> createState() => _EWalletPageState();
}

class _EWalletPageState extends State<EWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Column(
          children: [
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(12),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    onTap: (() {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                contentPadding: const EdgeInsets.all(30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 5,
                                title: const Text(
                                  "My Wallet",
                                  textAlign: TextAlign.center,
                                ),
                                content: SizedBox(
                                  height: 300,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey[300],
                                          radius: 40,
                                          child: Image.network(
                                            "$imgUrl/${context.watch<AuthProvider>().doctorModel!.doctorImage}",
                                            errorBuilder: ((context, error,
                                                    stackTrace) =>
                                                Image.asset(
                                                    'assets/images/user2.png')),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          context
                                              .read<AuthProvider>()
                                              .doctorModel!
                                              .doctorName,
                                          style: text2,
                                        ),
                                      ),
                                      Text(
                                        context
                                            .read<AuthProvider>()
                                            .doctorModel!
                                            .doctorNumber,
                                        style: text2,
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          '5,000',
                                          style: heading1,
                                        ),
                                      ),
                                      Text(
                                        'Current balance',
                                        style: text2,
                                      ),
                                    ],
                                  ),
                                ),
                                actionsAlignment: MainAxisAlignment.center,
                                // actionsOverflowAlignment:
                                //     OverflowBarAlignment.start,
                                actionsPadding: const EdgeInsets.all(20),
                                actions: [
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       vertical: 14.0),
                                  //   child: ElevatedButton(
                                  //       style: smallBlackButtonStyle1,
                                  //       onPressed: () {
                                  //         Navigator.pop(context);
                                  //         Navigator.push(
                                  //             context,
                                  //             MaterialPageRoute(
                                  //                 builder: (context) =>
                                  //                     const PayOutDetailsPage()));
                                  //       },
                                  //       child: Text(
                                  //         'Payout',
                                  //         style: text2,
                                  //       )),
                                  // ),
                                  ElevatedButton(
                                      style: smallBlackButtonStyle1,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('OK', style: text2)),
                                ],
                              ));
                      // Navigator.push(context, MaterialPageRoute(builder: ((context) => MyWalletPage())));
                    }),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: const Text('My Wallet'),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(12),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PayOutHistoryPage())));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: const Text('Payout History'),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(12),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const PayOutDetailsPage())));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: const Text('Bank Account Details'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
