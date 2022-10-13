import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
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
}