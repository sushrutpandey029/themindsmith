import 'package:intl/intl.dart';

String formateTime(String time) {
  try {
    String formattedTime =
        '${time.split(':').first} : ${time.split(':').elementAt(1)}';
    return formattedTime;
  } on RangeError catch (e) {
    return time;
  }
}

String formateDate(String date) {
  try {
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse(date));
    return formattedDate;
  } on FormatException catch (e) {
    // TODO
    return date;
  }
}

String formateDate1(String date) {
  try {
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse(date));
    return formattedDate;
  } on FormatException catch (e) {
    return date;
    // TODO
  }
}

bool compareDate(String date, String startedTime, String endedTime) {
  //return true if DateTime.now<date else false
  try {
    DateTime startTime = DateTime.parse('$date $startedTime');
    DateTime endTime = DateTime.parse('$date $endedTime');
    DateTime dateNow = DateTime.now();
    if (dateNow.isAfter(startTime) && dateNow.isBefore(endTime)) {
      return true;
    } else {
      return false;
    }
  } on FormatException catch (e) {
    return false;
  }
}
