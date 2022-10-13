import 'package:intl/intl.dart';

String formateTime(String time) {
  String formattedTime= '${time.split(':').first} : ${time.split(':').elementAt(1)}';
  return formattedTime;
}

String formateDate(String date) {
try {
  String formattedDate =  DateFormat('dd-MMMM-yyyy').format(DateFormat('yyyy-MM-dd').parse(date));
  return formattedDate;
} on FormatException catch (e) {
  return date;
  // TODO
}
}
String formateDate1(String date) {
try {
  String formattedDate =  DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse(date));
  return formattedDate;
} on FormatException catch (e) {
  return date;
  // TODO
}
  
}

bool compareDate(String date) {
  //return true if DateTime.now<date else false
  try {
 DateTime dateTime = DateTime.parse(date);
 DateTime dateNow = DateTime.now();
  return (dateTime.year==dateNow.year &&dateTime.month==dateNow.month && dateTime.day==dateNow.day);

} on FormatException catch (e) {
  return false;
}
}