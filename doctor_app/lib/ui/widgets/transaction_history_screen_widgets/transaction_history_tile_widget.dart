import 'package:flutter/material.dart';

class TransactionHistoryTileWidget extends StatelessWidget {
  const TransactionHistoryTileWidget(
      {Key? key, required this.amount, required this.name})
      : super(key: key);
  final String amount, name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2,
        child: ListTile(
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: const Text('Paid to'),
            subtitle: Text(name),
            trailing: SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Rs $amount'),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            )),
      ),
    );
  }
}
