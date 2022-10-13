import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'package:the_mindsmith/constants/url_constant.dart';
import 'package:the_mindsmith/models/user_model.dart';

import '../api/auth_api.dart';

class AuthRepo implements AuthApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String _userApi = baseUrl+"/Userapi_controller";

  @override
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

  @override
  Future<void> signOut() async {
    String url = _userApi + "/logout";
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
     Response response= await Dio().post(url);
     print(response.data);
      //GoogleSignIn().disconnect();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  @override
  Future<void> verifyPhoneNumber(
      String phoneNumber,
      PhoneVerificationCompleted verificationCompleted,
      PhoneVerificationFailed verificationFailed,
      PhoneCodeSent codeSent,
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout) async {
    print('firebase phone auth');
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91' + phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> verifyOtp(
      String verificationId, String smsCode) async {
    print('firebase verify otp');
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      return await _auth.signInWithCredential(phoneAuthCredential);
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> loginWithEmail(
      String email, String password) async {
    String url = _userApi + "/login";
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
    } on Exception catch (e) {
      rethrow;
    } 
  }

  @override
  Future<Map<String, dynamic>> readUser(String jwt) async {
    String url = _userApi + "/readuser";
    try {
      final response = await Dio()
          .post(url, options: Options(headers: {"Authorization": jwt}));

      // print(response.data);
      return response.data;
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> insertUser(UserModel userModel) async {
    String url = _userApi + "/insert";
    try {
      String fileNameFrontAadhar = userModel.frontImageAadhar.split('/').last;
      String fileNameBackAadhar = userModel.backImageAadhar.split('/').last;
      String fileNamepanImage = userModel.panCardImage.split('/').last;

    FormData formData = FormData.fromMap(
      {
      'user_reg_no': userModel.userRegNo,
      'user_name': userModel.userName,
      'user_email':userModel. userEmail,
      'user_phone': userModel.userPhone,
      'user_password': userModel.userPassword,
      'user_confirm_password': userModel.userConfirmPassword,
      'aadhar_name': userModel.aadharName,
      'aadhar_card_no': userModel.aadharCardNo,
      'gender': userModel.gender,
      'user_age': userModel.userAge,
      'front_image_aadhar' :  await MultipartFile.fromFile(userModel.frontImageAadhar, filename:fileNameFrontAadhar),
      'back_image_aadhar' :  await MultipartFile.fromFile(userModel.backImageAadhar, filename:fileNameBackAadhar),
      'pencard_image':  await MultipartFile.fromFile(userModel.panCardImage, filename:fileNamepanImage),
    
    });
      Response response = await Dio().post(url,
          data: formData,
          options: Options(
            validateStatus: (status) => true,
          ));
          print(response.data);
      return response.data;
    } on Exception catch (e) {
      rethrow;
    }
  }
}
