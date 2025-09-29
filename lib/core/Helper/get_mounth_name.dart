import 'package:intl/intl.dart';

abstract class GetMounthName {
  static String getMounthName(DateTime date) {
    DateFormat formater = DateFormat('MMM');
    return formater.format(date);
  }
}
