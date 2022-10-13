import 'package:flutter/material.dart';

import '../widgets/comman/app_bar.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({ Key? key }) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,"Support",),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              
              SizedBox(height: 40,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      shape: RoundedRectangleBorder(
                                   
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                      elevation: 2,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                                   
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                        title: Text(''),
                       ),
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Material(
                       shape: RoundedRectangleBorder(
                                   
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                      elevation: 2,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                                   
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                        title: Text('')
                       ,),
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