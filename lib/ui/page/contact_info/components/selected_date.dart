import 'package:flutter/material.dart';

Future<DateTime?> selectedDate(BuildContext context) async {
  final DateTime? dateTime = await showDatePicker(
    context: context,
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
  print(dateTime);
  return dateTime;
}
