import 'package:doctor_app/constants/button_style.dart';
import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/provider/achievement_provider.dart';
import 'package:doctor_app/ui/widgets/comman/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadAchievementsScreen extends StatefulWidget {
  const UploadAchievementsScreen({Key? key}) : super(key: key);

  @override
  State<UploadAchievementsScreen> createState() =>
      _UploadAchievementsScreenState();
}

class _UploadAchievementsScreenState extends State<UploadAchievementsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Upload Achievements'),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Consumer<AchievementProvider>(
         
          builder: (context, value , widget) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200.0, bottom: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                        style: fullButtonStyleWhite,
                        onPressed: () {
                          value.selectFile();
                        },
                        child: Text(value.fileName??'Click here to select a File')),
                  ),
                ),
                Text(
                  '(you can upload png, jpeg, pdf files)',
                  style: text3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: value.path==null?null:(){value.uploadPrescription(context);}, child: Text('Upload'),style: smallBlackButtonStyle1,),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
