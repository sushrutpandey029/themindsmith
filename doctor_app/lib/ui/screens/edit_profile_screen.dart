import 'dart:io';

import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/repo/update_repo_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/url_constant.dart';
import '../../provider/auth_provider.dart';
import '../widgets/comman/app_bar.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key, required this.isEditProfile}) : super(key: key);
  bool isEditProfile;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final UpdateRepo _updateRepo = UpdateRepo();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController languageSpokenController = TextEditingController();

  File? image;
  String? urlFromStorage;
  bool _isBioExpanded = false;

  Future pickImageFromGallery() async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
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

  Future pickImageFromCamera() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.camera);
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
    // DoctorModel doctorModel =
    //     Provider.of<AuthProvider>(context, listen: false).doctorModel!;
    return Consumer<AuthProvider>(builder: (context, value, wid) {
      return Scaffold(
        appBar: customAppBar(
          context,
          widget.isEditProfile ? "Edit Profile" : "My Profile",
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: SingleChildScrollView(
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
                                      '$imgUrl/${value.doctorModel!.doctorImage}',
                                    ),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black),
                              child: widget.isEditProfile
                                  ? GestureDetector(
                                      onTap: () {
                                        showProfilePictureDialog(context);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : SizedBox())
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(height: 20,),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title:
                                Text("Name : ${value.doctorModel!.doctorName}"),
                            trailing: widget.isEditProfile
                                ? GestureDetector(
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
                                  )
                                : null,
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Text(
                                "Email id : ${value.doctorModel!.doctorEmail}"),
                            trailing: widget.isEditProfile
                                ? GestureDetector(
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
                                  )
                                : null,
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Text(
                                "Phone : ${value.doctorModel!.doctorNumber}"),
                            // trailing: GestureDetector(
                            //   onTap: () {
                            //     showNumDialog(context);
                            //   },
                            //   child: const Padding(
                            //     padding: EdgeInsets.all(4.0),
                            //     child: Icon(
                            //       Icons.edit,
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            // ),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Text(
                                "Specialty : ${value.doctorModel!.doctorSpeciality}"),
                            trailing: widget.isEditProfile
                                ? GestureDetector(
                                    onTap: () {
                                      showSpecialityDialog(context);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            trailing: _isBioExpanded?null:Icon(Icons.arrow_drop_down_sharp),
                            onTap: () {
                              setState(() {
                                _isBioExpanded = !_isBioExpanded;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Text(
                                "Short Bio : ${value.doctorModel!.shortBio}",
                                style: TextStyle(
                                    overflow: _isBioExpanded
                                        ? TextOverflow.visible
                                        : TextOverflow.ellipsis)),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Text(
                                "Qualifications : ${value.doctorModel!.doctorQualification}"),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Text(
                                "Address : ${value.doctorModel!.doctorAddress}"),
                            trailing: widget.isEditProfile
                                ? GestureDetector(
                                    onTap: () {
                                      showAddressDialog(context);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Text(
                                "Language Spoken : ${value.doctorModel!.languageSpoken}"),
                            trailing: widget.isEditProfile
                                ? GestureDetector(
                                    onTap: () {
                                      showlanguageDialog(context);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title:
                                Text("Ratings : ${value.doctorModel!.rating}"),
                          ),
                        ),

                        // Card(
                        //   margin: const EdgeInsets.all(8),
                        //   elevation: 6,
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(20)),
                        //   child: ListTile(
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(15.0),
                        //     ),
                        //     title: Text("Fee : ${doctorModel.doctorFee}"),
                        //     trailing: GestureDetector(
                        //       onTap: () {
                        //         showFeeDialog(context);
                        //       },
                        //       child: const Padding(
                        //         padding: EdgeInsets.all(4.0),
                        //         child: Icon(
                        //           Icons.edit,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Text(
                                "Experience : ${value.doctorModel!.doctorExperience}"),
                            trailing: widget.isEditProfile
                                ? GestureDetector(
                                    onTap: () {
                                      showExperienceDialog(context);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        )
                      ],
                    ),
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
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            await _updateRepo.updateDocEmail(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .doctorModel!
                                    .doctorId,
                                emailController.text);

                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .refreshUserData();

                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .logOut(context);
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
                          'Enter new Name',
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
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            await _updateRepo.updateDocName(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .doctorModel!
                                    .doctorId,
                                nameController.text);

                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .refreshUserData();
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .logOut(context);
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

  showNumDialog(BuildContext context) {
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
                          'Enter new number',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildNumFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Update"),
                          onPressed: () async {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            await _updateRepo.updateDocNumber(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .doctorModel!
                                    .doctorId,
                                numController.text);
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .logOut(context);
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

  showAddressDialog(BuildContext context) {
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
                          'Enter new address',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildAddressFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Update"),
                          onPressed: () async {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            await _updateRepo.updateDocAddress(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .doctorModel!
                                    .doctorId,
                                addressController.text);
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .refreshUserData();
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .logOut(context);
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

  showFeeDialog(BuildContext context) {
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
                          'Enter new fee',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildFeeFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Update"),
                          onPressed: () async {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            await _updateRepo.updateDocFee(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .doctorModel!
                                    .doctorId,
                                feeController.text);
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .refreshUserData();
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .logOut(context);
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

  showSpecialityDialog(BuildContext context) {
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
                          'Enter new speciality',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildSpecialityFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Update"),
                          onPressed: () async {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            await _updateRepo.updateDocSpeciality(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .doctorModel!
                                    .doctorId,
                                specialityController.text);
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .refreshUserData();
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .logOut(context);
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

  showlanguageDialog(BuildContext context) {
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
                          'Enter Langugaes Spoken',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildLanguageSpokenFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Update"),
                          onPressed: () async {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            await _updateRepo.updateDoclanguagesspoken(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .doctorModel!
                                    .doctorId,
                                languageSpokenController.text);
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .refreshUserData();
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .logOut(context);
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

  showExperienceDialog(BuildContext context) {
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
                          'Enter new experience',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildExperienceFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Update"),
                          onPressed: () async {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );

                            await _updateRepo.updateDocExperience(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .doctorModel!
                                    .doctorId,
                                experienceController.text);
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .refreshUserData();

                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .logOut(context);
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                "Camera",
                                style: TextStyle(fontSize: 16),
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
                                style: TextStyle(fontSize: 16),
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
                            await _updateRepo.uploadImage(
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .doctorModel!
                                    .doctorId,
                                image!);
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .refreshUserData();
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return logoutalert();
                            //   },
                            // );
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .logOut(context);
                            // Navigator.pop(context);
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

  TextField buildAddressFormField() {
    return TextField(
      controller: addressController,
      decoration: const InputDecoration(hintText: 'Enter Your Address'),
    );
  }

  TextField buildExperienceFormField() {
    return TextField(
      controller: experienceController,
      decoration: const InputDecoration(hintText: 'Enter Your Experience'),
    );
  }

  TextField buildFeeFormField() {
    return TextField(
      controller: feeController,
      decoration: const InputDecoration(hintText: 'Enter Your Fee'),
    );
  }

  TextField buildNameFormField() {
    return TextField(
      controller: nameController,
      decoration: const InputDecoration(hintText: 'Enter Your Name'),
    );
  }

  TextField buildNumFormField() {
    return TextField(
      controller: numController,
      decoration: const InputDecoration(hintText: 'Enter Your Mobile Number'),
    );
  }

  TextField buildSpecialityFormField() {
    return TextField(
      controller: specialityController,
      decoration: const InputDecoration(hintText: 'Enter Your Speciality'),
    );
  }

  TextField buildLanguageSpokenFormField() {
    return TextField(
      controller: languageSpokenController,
      decoration: const InputDecoration(hintText: 'Enter Langugae Spoken'),
    );
  }
}
