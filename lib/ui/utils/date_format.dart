import 'package:intl/intl.dart';

String dateFormatted(DateTime date) {
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  return dateFormat.format(date);
}
