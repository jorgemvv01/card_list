import 'package:intl/intl.dart';

class Util {
  Util._();

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy hh:mm:ss a').format(dateTime);
  }
}
