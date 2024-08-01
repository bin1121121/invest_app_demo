import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: CustomTextStyle().contentTextStyle(color: color),
      ),
    );
  }
}
