import 'package:flutter/services.dart';

List<TextInputFormatter> inputFormatters = [
  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
  LengthLimitingTextInputFormatter(10),
];
