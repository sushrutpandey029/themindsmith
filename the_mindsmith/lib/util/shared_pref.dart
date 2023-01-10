import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref _sharedPref = SharedPref._internal();
  factory SharedPref() {
    return _sharedPref;
  }
  SharedPref._internal();

  Future<void> setData(String userResponse) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
     bool status = await preferences.setString('userResponse', userResponse);
     print(status);
  }

  Future<String?> getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userResponse = preferences.getString('userResponse');
    return userResponse;
  }
   
   Future<void> removeData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('userResponse');
   }

   Future<void> setDate() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     bool status = await preferences.setInt('dateTime', DateTime.now().millisecondsSinceEpoch);
     print(status);
   }

    Future<int?> getDate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? dateTime = preferences.getInt('dateTime');
    return dateTime;
  }

  Future<bool> setToken(String token) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
      bool status = await preferences.setString('token', token);
   return status;
  }
  
  Future<String> getToken() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token')??'';
    return token;
  }
}