import 'package:intl/intl.dart';

String formateTime(String time) {
  try {
  String formattedTime= '${time.split(':').first} : ${time.split(':').elementAt(1)}';
   return formattedTime;
} on RangeError catch (e) {
  return time;
}
 
}

String formateDate(String date) {
try {
  String formattedDate =  DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse(date));
    return formattedDate;
} on FormatException catch (e) {
  // TODO
  return date;

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