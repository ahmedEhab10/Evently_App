import 'package:intl/intl.dart';

abstract class convetdate {
  static String getMounthName(DateTime date) {
    DateFormat formater = DateFormat('MMM');
    return formater.format(date);
  }

  static String getDayName(DateTime date) {
    DateFormat formater = DateFormat('EEE');
    return formater.format(date);
  }

  static String TimeConvert(DateTime date) {
    DateFormat formater = DateFormat('dd MMMM yyyy');
    return formater.format(date);
  }
}
