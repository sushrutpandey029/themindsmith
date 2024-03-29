import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/services/api/auth_api.dart';
import 'package:the_mindsmith/services/repo/auth_repo.dart';
import 'package:the_mindsmith/ui/screens/id_verification_screen.dart';
import 'package:the_mindsmith/ui/screens/login_screen.dart';
import 'package:the_mindsmith/util/error_dialogue.dart';
import 'package:the_mindsmith/util/shared_pref.dart';

import '../models/auth_user_model.dart';
import '../models/user_model.dart';
import '../ui/screens/fill_details_screen.dart';
import '../ui/screens/wrapper.dart';
import '../util/phone_number_validator.dart';
import 'notification_provider.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  final AuthRepo _authApi = AuthRepo();
  String? verificationId;
  bool isOtpSent = false;
  String? jwt;
  // Map<String, dynamic>? userResponse;
  AuthUserModel? authUserModel;
  UserModel? userModel;
  final SharedPref _pref = SharedPref();

  Future<void> signInWithFb(BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()));
      UserCredential userCredential = await _authApi.signInWithFacebook();
      final currentUser = userCredential.user;
      final usertime = currentUser!.metadata.creationTime;
      UserModel? user = await _authApi.getUserByFbId(currentUser.uid);
      if (user != null) {
        userModel = user;
        await _pref.setData(json.encode(userModel!.toMap()));
        await _pref.setDate();
        print(userModel);
        // print(userResponse);
         await _authApi.updateFCMToken(userModel!.id,);
        Provider.of<NotificationProvider>(context, listen: false)
            .fetchNotification(context);
        print(' done at sign in');
        Navigator.pop(context);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const Wrapper())));
      } else {
        authUserModel = AuthUserModel(
          userRegNo: '',
          userName: currentUser.displayName!,
          userEmail: currentUser.email!,
          userPhone: "",
          userPassword: "facebook",
          userConfirmPassword: "facebook",
          aadharName: '',
          aadharCardNo: '',
          gender: '',
          userAge: '',
          frontImageAadhar: '',
          backImageAadhar: '',
          panCardImage: '',
          userlocation: '',
          fbId: currentUser.uid,
        );
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const FillDetailsPage()));
        await _authApi.signOut();
      }
    } on FirebaseAuthException catch (e) {
      errorDialogue(context: context, title: e.code, message: e.message);
    }
    notifyListeners();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()));
      UserCredential userCredential = await _authApi.signInWithGoogle();
      final currentUser = userCredential.user;
      final usertime = currentUser!.metadata.creationTime;
      UserModel? user = await _authApi.getUserByGoogleId(currentUser.uid);
      if (user != null) {
        userModel = user;
        await _pref.setData(json.encode(userModel!.toMap()));
        await _pref.setDate();
        print(userModel);
        // print(userResponse);
         await _authApi.updateFCMToken(userModel!.id,);
        Provider.of<NotificationProvider>(context, listen: false)
            .fetchNotification(context);
        print(' done at sign in');
        Navigator.pop(context);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const Wrapper())));
      } else {
        authUserModel = AuthUserModel(
          userRegNo: '',
          userName: currentUser.displayName!,
          userEmail: currentUser.email!,
          userPhone: "",
          userPassword: "google",
          userConfirmPassword: "google",
          aadharName: '',
          aadharCardNo: '',
          gender: '',
          userAge: '',
          frontImageAadhar: '',
          backImageAadhar: '',
          panCardImage: '',
          userlocation: '',
          googleId: currentUser.uid,
        );
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const FillDetailsPage()));
        await _authApi.signOut();
      }
    } on FirebaseAuthException catch (e) {
      errorDialogue(context: context, title: e.code, message: e.message);
    }
    notifyListeners();
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context) async {
    if (isValidPhoneNumber(phoneNumber) == false) {
      errorDialogue(
          context: context,
          title: 'error!!',
          message: 'please enter a valid phone number');
      return;
    }
    verificationCompleted(PhoneAuthCredential phoneAuthCredential) {
      PhoneAuthCredential _phoneAuthCredential = phoneAuthCredential;
    }

    verificationFailed(FirebaseAuthException e) {
      Navigator.pop(context);
      errorDialogue(context: context, title: e.code, message: e.message);
      print(e.message);
    }

    codeSent(String verificationId, int? resendToken) async {
      this.verificationId = verificationId;
      isOtpSent = true;
      Navigator.pop(context);
      notifyListeners();
    }

    codeAutoRetrievalTimeout(String verificationId) {
      this.verificationId = verificationId;
      isOtpSent = true;
      notifyListeners();
      // Navigator.pop(context);
    }

    print('verify phone num ');
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await _authApi.verifyPhoneNumber(phoneNumber, verificationCompleted,
          verificationFailed, codeSent, codeAutoRetrievalTimeout);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      errorDialogue(context: context, title: e.code, message: e.message);
    }
  }

  Future<void> verifyOtp(String smsCode, BuildContext context) async {
    print('verify otp');
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      isOtpSent = false;
      await _authApi.verifyOtp(verificationId!, smsCode);
      isOtpSent = false;
      _currentUser = FirebaseAuth.instance.currentUser;
      authUserModel!.userPhone = _currentUser!.phoneNumber!;
      Navigator.pop(context);
      print(authUserModel);

      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const IdVerificationPage()));
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LogInPage()));

    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      errorDialogue(context: context, title: e.code, message: e.message);
    }
    notifyListeners();
  }

  void signOut(BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()));

      await _authApi.signOut();
      await _pref.removeData();
      await _pref.setToken("");
      await _authApi.updateFCMToken(userModel!.id);
      // _currentUser = FirebaseAuth.instance.currentUser;
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: ((context) => const LogInPage())),
          (route) {
        return route ==
            MaterialPageRoute(builder: ((context) => const LogInPage()));
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } on Exception {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> refreshUser() async {
    userModel = await _authApi.getUser(userModel!.id);
    await _pref.setData(json.encode(userModel!.toMap()));
    notifyListeners();
  }

  Future<void> loginWithEmail(
      String email, String password, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      Map<String, dynamic> response =
          await _authApi.loginWithEmail(email, password);
      if (response['status'] == 1) {
        jwt = response['jwt'];
        if (jwt != null) {
          jwt = response['jwt'];

          // userResponse = await _authApi.readUser(jwt!);
          userModel = UserModel.fromMap(await _authApi.readUser(jwt!));
          await _pref.setData(json.encode(userModel!.toMap()));
          await _pref.setDate();
          await _authApi.updateFCMToken(userModel!.id,);
          print(userModel);
          // print(userResponse);
          Provider.of<NotificationProvider>(context, listen: false)
              .fetchNotification(context);
          print(' done at sign in');
          Navigator.pop(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const Wrapper())));
        }

        Provider.of<NotificationProvider>(context, listen: false)
            .fetchNotification(context);
        // Provider.of<ArticlesProvider>(context,listen: false).fetchArticles();
      } else {
        Navigator.pop(context);
        errorDialogue(
            context: context,
            title: 'error!! status : ' + response['status'].toString(),
            message: response['message']);
        print(response['message']);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> insertUser(BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()));
      authUserModel?.userRegNo = generateRegistrationNumber();
      print(authUserModel);
      var response = await _authApi.insertUser(authUserModel!);
      if (response["status"] == 1) {
        errorDialogue(
            context: context,
            title: 'Success!!',
            message: 'User created Successful');
        // userResponse = await _authApi.readUser(jwt!);
        // await _pref.setData(json.encode(userResponse));
        // await _pref.setDate();
        // print(userResponse);
        // Provider.of<NotificationProvider>(context, listen: false)
        //     .fetchNotification(context);
        // print(' done at sign in');
        Navigator.pop(context);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const LogInPage())));

        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Create Successfully"),duration: Duration(seconds: 2),));
      } else {
        Navigator.pop(context);
        errorDialogue(
            context: context,
            title: 'Error!!',
            message: json.encode(response['messages']),
            route: const LogInPage());
        // await Future.delayed(const Duration(seconds: 2));

        //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is a problem in Creating Account for you"),duration: Duration(seconds: 5),));
      }
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => const LogInPage()));
//  Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => AskMobilePage()));

    } on Exception catch (e) {
      Navigator.pop(context);
      errorDialogue(context: context, title: "error!!", message: e.toString());
    }
  }

  String generateRegistrationNumber() {
    DateTime dateTime = DateTime.now();
    int timeFactor = dateTime.millisecondsSinceEpoch % 1000000;

    String regNo = 'MS${timeFactor.toString()}${dateTime.year}';
    return regNo;
  }
}
