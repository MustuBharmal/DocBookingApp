import 'package:intl/intl.dart';

abstract class CustomDateUtils {
  static List<DateTime> getThisWeekRange() {
    List<DateTime> result = [];
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final DateTime start = today.subtract(Duration(days: today.weekday - 1));
    for (int i = 0; i < 7; i++) {
      result.add(start.add(Duration(days: i)));
    }
    return result;
  }

  static List<DateTime> getNext7DaysRange() {
    List<DateTime> result = [];
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    for (int i = 0; i < 7; i++) {
      result.add(today.add(Duration(days: i)));
    }
    return result;
  }

  static String getDay(DateTime date) => DateFormat('EEE').format(date);

  static String getDayAndDate(DateTime date) => DateFormat('EEE dd, MMM yy').format(date);

  static String getDate(DateTime date) => DateFormat('dd').format(date);

  static DateTime get today => DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
}
