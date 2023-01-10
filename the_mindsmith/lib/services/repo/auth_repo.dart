import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'package:the_mindsmith/constants/url_constant.dart';
import 'package:the_mindsmith/models/auth_user_model.dart';
import 'package:the_mindsmith/util/shared_pref.dart';

import '../../models/user_model.dart';
import '../api/auth_api.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String _userApi = "$baseUrl/Userapi_controller";

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  Future<UserModel?> getUserByFbId(String fbId) async {
    String path = "$_userApi/getuserbyfbid";
    Response response = await Dio().post(path, data: {"fb_id": fbId});
    print(response.data);
    if (response.data["status"] == 1) {
      return UserModel.fromMap(response.data["data"][0]);
    }
  }

  Future<UserModel?> getUserByGoogleId(String gId) async {
    String path = "$_userApi/getgoogleiduser";
    Response response = await Dio().post(path, data: {"google_id": gId});
    print(response.data);
    if (response.data["status"] == 1) {
      return UserModel.fromMap(response.data["data"][0]);
    }
  }

  Future<void> signOut() async {
    String url = "$_userApi/logout";
    try {
      if (await GoogleSignIn().isSignedIn()) {
        try {
          await GoogleSignIn().disconnect();
          await _auth.signOut();
        } on Exception {
          rethrow;
        }
      }

      // await _read(firebaseAuthProvider).signOut(); // which is basically firebase auth signout
      Response response = await Dio().post(url);
      print(response.data);
      //GoogleSignIn().disconnect();
      FacebookAuth.instance.logOut();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber,
      PhoneVerificationCompleted verificationCompleted,
      PhoneVerificationFailed verificationFailed,
      PhoneCodeSent codeSent,
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout) async {
    print('firebase phone auth');
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<UserCredential> verifyOtp(
      String verificationId, String smsCode) async {
    print('firebase verify otp');
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      return await _auth.signInWithCredential(phoneAuthCredential);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> loginWithEmail(
      String email, String password) async {
    String url = "$_userApi/login";
    try {
      final responce = await Dio().post(url,
          data: {"user_email": email, "user_password": password},
          options: Options(
              followRedirects: false,
              validateStatus: (status) => true,
              headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
              }));
      print(responce.statusCode);
      print(responce.data);
      return responce.data;
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> readUser(String jwt) async {
    String url = "$_userApi/readuser";
    try {
      final response = await Dio()
          .post(url, options: Options(headers: {"Authorization": jwt}));

      print(response.data);
      return response.data['users'];
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> insertUser(AuthUserModel userModel) async {
    String url = "$_userApi/insert";
    try {
      String fileNameFrontAadhar = userModel.frontImageAadhar.split('/').last;
      String fileNameBackAadhar = userModel.backImageAadhar.split('/').last;
      String fileNamepanImage = userModel.panCardImage.split('/').last;

      FormData formData = FormData.fromMap({
        'user_reg_no': userModel.userRegNo,
        'user_name': userModel.userName,
        'user_email': userModel.userEmail,
        'user_phone': userModel.userPhone,
        'user_password': userModel.userPassword,
        'user_confirm_password': userModel.userConfirmPassword,
        'aadhar_name': userModel.aadharName,
        'aadhar_card_no': userModel.aadharCardNo,
        'gender': userModel.gender,
        'user_age': userModel.userAge,
        'google_id': userModel.googleId,
        'fb_id' : userModel.fbId,
        'front_image_aadhar': await MultipartFile.fromFile(
            userModel.frontImageAadhar,
            filename: fileNameFrontAadhar),
        'back_image_aadhar': await MultipartFile.fromFile(
            userModel.backImageAadhar,
            filename: fileNameBackAadhar),
        'pencard_image': await MultipartFile.fromFile(userModel.panCardImage,
            filename: fileNamepanImage),
      });
      Response response = await Dio().post(url,
          data: formData,
          options: Options(
            validateStatus: (status) => true,
          ));
      print(response.data);
      return response.data;
    } on Exception {
      rethrow;
    }
  }

  Future<UserModel?> getUser(String userId) async {
    String path = "$_userApi/getuser";
    Response response = await Dio().post(path, data: {"user_id": userId});
    // print(response.data["data"]["id"]);
    if (response.data["data"] != null) {
      return UserModel.fromMap(response.data["data"]);
    }
    return null;
  }

  Future<void> updateFCMToken(String userId) async {
    String path = "$_userApi/update_user_pushtoken";
    String fcmToken= await SharedPref().getToken();
   Response response = await  Dio().post(path, data: {"user_id": userId, "pushtoken": fcmToken});
   print(response.data);
  }
}
