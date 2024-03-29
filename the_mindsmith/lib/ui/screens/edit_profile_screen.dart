import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/models/user_model.dart';
import 'package:the_mindsmith/providers/auth_provider.dart';
import 'package:the_mindsmith/services/repo/update_repo.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/url_constant.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final UpdateRepo _updateRepo = UpdateRepo();
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
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      } else {
        final imageTemp = File(image.path);
        setState(() {
          this.image = imageTemp;
        });
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
    super.initState();
    readFromStorage();
  }

  // AlertDialog logoutalert() {
  //   return AlertDialog(
  //     title: const Text(
  //       'You are about to get logged out!',
  //       textAlign: TextAlign.center,
  //     ),
  //     content: const Text(
  //       'Login again.',
  //       textAlign: TextAlign.center,
  //     ),
  //     actions: [
  //       TextButton(
  //         child: const Text(
  //           'OK',
  //           style: TextStyle(color: Colors.grey),
  //         ),
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, value, wid) {
      return Scaffold(
        appBar: customAppBar(context, 'Edit Profile'),
        body: SingleChildScrollView(
          child: Padding(
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
                              backgroundImage: image != null
                                  ? FileImage(image!) as ImageProvider
                                  : NetworkImage(
                                      '$imgUrl/${value.userModel!.userImage}',
                                    ),
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
                          value.userModel!.userName,
                          style: text2,
                        ),
                      ),
                      Text(value.userModel!.userRegNo)
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
                          title: Text("Name : ${value.userModel!.userName}"),
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
                              Text("Email id : ${value.userModel!.userEmail}"),
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
                          title: Text("Phone : ${value.userModel!.userPhone}"),
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
                          title: Text("Gender : ${value.userModel!.gender}"),
                          trailing: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ChangeGenderDialog();
                                },
                              );
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
                          title: Text("Age : ${value.userModel!.userAge}"),
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
        ),
      );
    });
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
                                    .userModel!
                                    .id,
                                emailController.text);
                            await context.read<AuthProvider>().refreshUser();
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .signOut(context);
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
                                    .userModel!
                                    .id,
                                nameController.text);
                            await context.read<AuthProvider>().refreshUser();
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .signOut(context);
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
                                    .userModel!
                                    .id,
                                ageController.text);
                            await context.read<AuthProvider>().refreshUser();
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .signOut(context);
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
                height: height * 0.25,
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
                          onPressed: () async {
                            Navigator.pop(context);

                            await _updateRepo.uploadImage(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .userModel!
                                    .id,
                                image!);
                            await context.read<AuthProvider>().refreshUser();
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .signOut(context);
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
      decoration: const InputDecoration(hintText: 'Enter Your Username'),
    );
  }

  TextField buildAgeFormField() {
    return TextField(
      controller: ageController,
      decoration: const InputDecoration(hintText: 'Enter Your Age'),
    );
  }
}

class ChangeGenderDialog extends StatefulWidget {
  ChangeGenderDialog({Key? key}) : super(key: key);

  @override
  State<ChangeGenderDialog> createState() => _ChangeGenderDialogState();
}

class _ChangeGenderDialogState extends State<ChangeGenderDialog> {
  List<String> genderList = [
    "Male",
    "Female",
    "InterSex",
    "FTM Trans",
    "MTF Trans",
    "Gender Fluid",
    "Prefer not to say"
  ];
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
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
                height: height / 1.85,
                width: width,
                color: Colors.white,
                child: Form(
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Select Gender',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: genderList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(genderList.elementAt(index),style: selectedIndex != null &&
                                        selectedIndex == index
                                    ? TextStyle(
                                    fontWeight:  FontWeight.bold,fontSize: 18
                                  ):null,),
                                  Divider(
                                    thickness: 2,
                                  )
                                ],
                              ),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Update"),
                          onPressed:selectedIndex==null?null: () async {
                          await  UpdateRepo().updateUserGender(context.read<AuthProvider>().userModel!.id, genderList.elementAt(selectedIndex!));
                            context.read<AuthProvider>().refreshUser();
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
  }
}
