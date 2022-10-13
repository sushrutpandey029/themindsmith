import 'package:flutter/material.dart';

class WithdrawHistoryTileWidget extends StatelessWidget {
   WithdrawHistoryTileWidget({Key? key,required this.amount,required this.days}) : super(key: key);
String amount,days;
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
            title: Text('Withdraw'),
            subtitle: Text('$days days ago'),
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
