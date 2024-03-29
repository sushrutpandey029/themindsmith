import 'package:doctor_app/constants/text_style.dart';
import 'package:flutter/material.dart';

class PayoutHistoryTileWidget extends StatelessWidget {
  const PayoutHistoryTileWidget(
      {Key? key,
      required this.name,
      required this.amount,
      required this.bankName})
      : super(key: key);
  final String name, amount, bankName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
          onTap: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: const Text('Received from'),
          subtitle: Text(name),
          trailing: SizedBox(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rs $amount',
                  style: text3,
                ),
                Text(
                  'Credited to $bankName',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          )),
    );
  }
}
