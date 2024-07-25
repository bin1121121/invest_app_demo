import 'package:intl/intl.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';

String dateFormatted(DateTime date) {
  DateFormat dateFormat = DateFormat(AppConstants.formatDDMMYYYY);
  return dateFormat.format(date);
}
