import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/providers/auth_provider.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';
import 'package:the_mindsmith/util/error_dialogue.dart';

class IdVerificationPage extends StatefulWidget {
  const IdVerificationPage({Key? key}) : super(key: key);

  @override
  State<IdVerificationPage> createState() => _IdVerificationPageState();
}

class _IdVerificationPageState extends State<IdVerificationPage> {
  final ImagePicker _picker = ImagePicker();
  String? frontImageAadhar;
  String? backImageAadhar;
  String? panCardImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'ID Verification'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Text(
              'I\'D Verfication',
              style: heading1,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize:
                          Size.fromWidth(MediaQuery.of(context).size.width)),
                  onPressed: () async {
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      Provider.of<AuthProvider>(context, listen: false)
                          .userModel
                          ?.frontImageAadhar = image.path;

                      setState(() {
                        frontImageAadhar = image.name;
                      });
                    }
                  },
                  child: Text(frontImageAadhar ??
                      'Upload Aadhar card front side Photo')),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize:
                          Size.fromWidth(MediaQuery.of(context).size.width)),
                  onPressed: () async {
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      Provider.of<AuthProvider>(context, listen: false)
                          .userModel
                          ?.backImageAadhar = image.path;

                      setState(() {
                        backImageAadhar = image.name;
                      });
                    }
                  },
                  child: Text(
                      backImageAadhar ?? 'Upload Aadhar card back side Photo')),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.white,
                      fixedSize:
                          Size.fromWidth(MediaQuery.of(context).size.width)),
                  onPressed: () async {
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      Provider.of<AuthProvider>(context, listen: false)
                          .userModel
                          ?.panCardImage = image.path;

                      setState(() {
                        panCardImage = image.name;
                      });
                    }
                  },
                  child: Text(panCardImage ?? 'Upload Pan card Photo')),
            ),
            //  Padding(
            //    padding: const EdgeInsets.symmetric(vertical:8.0),
            //    child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10)),
            //               fixedSize: Size.fromWidth(
            //                   MediaQuery.of(context).size.width / 3),
            //               primary: Colors.white,
            //               onPrimary: Colors.black),
            //           onPressed: () {},
            //           child: Text('Upload')),
            //  ),
            const Spacer(
              flex: 1,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fixedSize: Size.fromWidth(
                          MediaQuery.of(context).size.width / 3)),
                  onPressed: () {
                    // UserModel userModel = Provider.of<AuthProvider>(context,listen: false).userModel!;
                    if (frontImageAadhar != null &&
                        backImageAadhar != null &&
                        panCardImage != null) {
                      Provider.of<AuthProvider>(context, listen: false)
                          .insertUser(context);
                    } else {
                      errorDialogue(
                          context: context,
                          title: 'error!!',
                          message: 'please select a file');
                    }
                  },
                  child: const Text('Continue')),
            ),
          ],
        ),
      ),
    );
  }
}
