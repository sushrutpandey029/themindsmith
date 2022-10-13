import 'package:flutter/material.dart';

class TransactionHistoryTileWidget extends StatelessWidget {
   TransactionHistoryTileWidget({Key? key,required this.amount,required this.name}) : super(key: key);
  String amount,name;

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
            onTap: () {
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Text('Paid to'),
            subtitle: Text(name),
            trailing: SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Rs $amount'),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            )),
      ),
    );
  }
}