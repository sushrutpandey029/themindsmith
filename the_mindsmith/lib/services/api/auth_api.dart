import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_mindsmith/models/auth_user_model.dart';
import 'package:the_mindsmith/models/user_model.dart';

abstract class AuthApi {
  Future<UserCredential> signInWithGoogle();
  Future<void> verifyPhoneNumber(
      String phoneNumber,
      PhoneVerificationCompleted verificationCompleted,
      PhoneVerificationFailed verificationFailed,
      PhoneCodeSent codeSent,
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout);
  Future<UserCredential> verifyOtp(String verificationId, String smsCode);
  Future<void> signOut();
  Future<Map<String, dynamic>> loginWithEmail(String email, String password);
  Future<Map<String,dynamic>> readUser(String jwt);
  Future<Map<String,dynamic>> insertUser(AuthUserModel userModel);
  Future<UserModel?> getUser(String userId);
}
