import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/providers/auth_provider.dart';
import 'package:the_mindsmith/services/repo/update_repo.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UpdateRepo _updateRepo = UpdateRepo();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  File? image;
  String? urlFromStorage;

  Future pickImageFromGallery() async {
    try {
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (context) => Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // );
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      } else {
        final imageTemp = File(image.path);
        setState(() {
          this.image = imageTemp;
        });

        _updateRepo.uploadImage(
            Provider.of<AuthProvider>(context, listen: false)
                .userResponse!['users']['id'],
            image as File);
        // Provider.of<AuthProvider>(context, listen: false).signOut(context);
      }
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick image; $e'),
        ),
      );
    }
  }

  Future pickImageFromCamera() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      } else {
//TODO
      }
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick image; $e'),
        ),
      );
    }
  }

  final storage = const FlutterSecureStorage();

  void readFromStorage() async {
    urlFromStorage = await storage.read(key: "KEY_URL") ?? 'not working';
    setState(
      () {},
    );
  }

  onFileSubmit(String url) async {
    await storage.write(key: "KEY_URL", value: url);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userMap =
        Provider.of<AuthProvider>(context, listen: false).userResponse!;
    return Scaffold(
      appBar: customAppBar(context, 'Edit Profile'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 40,
                          //TODO:MAke this dynamic and make sure the pic gets updated
                          child: image != null
                              ? Image.file(image!)
                              : FlutterLogo(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showProfilePictureDialog(context);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      userMap['users']['user_name'],
                      style: text2,
                    ),
                  ),
                  Text(Provider.of<AuthProvider>(context, listen: false)
                      .userResponse!['users']['user_reg_no'])
                  // Text('click to change profile image')
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text("Name : ${userMap['users']['user_name']}"),
                      trailing: GestureDetector(
                        onTap: () {
                          showNameDialog(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title:
                          Text("Email id : ${userMap['users']['user_email']}"),
                      trailing: GestureDetector(
                        onTap: () {
                          showEmailDialog(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text("Phone : ${userMap['users']['user_phone']}"),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text("Gender : ${userMap['users']['gender']}"),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: Text("Age : ${userMap['users']['user_age']}"),
                      trailing: GestureDetector(
                        onTap: () {
                          showAgeDialog(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showEmailDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      // title: const Text(
      //   "Enter Username",
      //   style: TextStyle(color: Colors.white),
      // ),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: height - 600,
                width: width,
                color: Colors.white,
                child: Form(
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Enter new Email',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildEmailFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Update"),
                          onPressed: () async {
                            await _updateRepo.updateUserEmail(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .userResponse!['users']['id'],
                                emailController.text);
                            Provider.of<AuthProvider>(context, listen: false)
                                .signOut(context);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showNameDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      // title: const Text(
      //   "Enter Username",
      //   style: TextStyle(color: Colors.white),
      // ),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: height - 600,
                width: width,
                color: Colors.white,
                child: Form(
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Enter new user Name',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildNameFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Update"),
                          onPressed: () async {
                            await _updateRepo.updateUserName(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .userResponse!['users']['id'],
                                nameController.text);
                            Provider.of<AuthProvider>(context, listen: false)
                                .signOut(context);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAgeDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      // title: const Text(
      //   "Enter Username",
      //   style: TextStyle(color: Colors.white),
      // ),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: height - 600,
                width: width,
                color: Colors.white,
                child: Form(
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Enter new user Age',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildAgeFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Update"),
                          onPressed: () async {
                            await _updateRepo.updateUserAge(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .userResponse!['users']['id'],
                                ageController.text);
                            Provider.of<AuthProvider>(context, listen: false)
                                .signOut(context);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showProfilePictureDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      // title: Text(
      //   "Enter Username",
      //   style: TextStyle(color: Colors.white),
      // ),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: height - 650,
                width: width,
                color: Colors.white,
                child: Form(
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Choose any one',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                "Camera",
                                style: TextStyle(fontSize: 24),
                              ),
                              onPressed: () {
                                pickImageFromCamera();
                              },
                            ),
                            const SizedBox(
                              width: 55,
                            ),
                            TextButton(
                              child: const Text(
                                "Gallery",
                                style: TextStyle(fontSize: 24),
                              ),
                              onPressed: () {
                                pickImageFromGallery();
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Update"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  TextField buildEmailFormField() {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(hintText: 'Enter Your Email'),
    );
  }

  TextField buildNameFormField() {
    return TextField(
      controller: nameController,
      decoration: const InputDecoration(hintText: 'Enter Your Email'),
    );
  }

  TextField buildAgeFormField() {
    return TextField(
      controller: ageController,
      decoration: const InputDecoration(hintText: 'Enter Your Email'),
    );
  }
}
