import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';

Widget customTextButton({
  required String text,
  required Function() onPressed,
  required Color color,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: customContentTextStyle(color: color),
    ),
  );
}
