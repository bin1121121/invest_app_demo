import 'package:flutter/material.dart';

void customShowBottomSheet(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return widget;
    },
  );
}
