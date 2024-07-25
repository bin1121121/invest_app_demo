import 'package:flutter/services.dart';

List<TextInputFormatter> inputFormattersForNumberPhone = [
  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
  LengthLimitingTextInputFormatter(10),
];
