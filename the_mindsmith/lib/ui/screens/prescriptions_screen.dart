
//not in use


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/models/user_prescription_model.dart';
import 'package:the_mindsmith/providers/prescription_provider.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/url_constant.dart';

class PrescriptionPage extends StatefulWidget {
  PrescriptionPage({Key? key}) : super(key: key);

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context, 'All Prescriptions'),
      body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Consumer<PrescriptionProvider>(
        builder: (context, value, widget) {
          return Column(
            children: [
              if (value.isLoading)
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                  ),
                ),
              Flexible(
                child: ListView.builder(
                    itemCount: value.prescriptionModel.length,
                    itemBuilder: ((context, index) {
                      UserPrescriptionModel userPrescriptionModel =
                          value.prescriptionModel.elementAt(index);
                      return Card(
                         margin: EdgeInsets.all(8),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                        child: ListTile(
                          
                          onTap: (){
                             launchUrl(
                            Uri.parse(
                                '$pdfUrl/${value.prescriptionModel.elementAt(index).fileName}'),
                            mode: LaunchMode.externalApplication);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          title:Text(userPrescriptionModel.userName),
                           subtitle:  Text(userPrescriptionModel.remark,overflow: TextOverflow.ellipsis,),
                          trailing: Image.network('https://img.icons8.com/color/48/000000/pdf.png',width: 30,),
                        ),
                      );
                    })),
              ),
            ],
          );
        },
      ),
    )
    );
  }
}
