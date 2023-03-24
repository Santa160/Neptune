import 'package:intl/intl.dart';

class DateTimeFormator {
  static String dateTimeFomator(DateTime dateTime) {
    final DateFormat date = DateFormat('MMMEd');
    final DateFormat year = DateFormat('yyyy');
    final DateFormat time = DateFormat('HH:mm');
    final String fdate = date.format(dateTime);
    final String fyear = year.format(dateTime);
    final String ftime = time.format(dateTime);
    return "$fdate $fyear | $ftime";
  }
}

class DateTimeNotTime {
  static String dateTimeFomator(DateTime dateTime) {
    final DateFormat date = DateFormat('MMMEd');
    final DateFormat year = DateFormat('yyyy');
    final DateFormat time = DateFormat('HH:mm');
    final String fdate = date.format(dateTime);
    final String fyear = year.format(dateTime);
    final String ftime = time.format(dateTime);
    return "$fdate $fyear";
  }
}
