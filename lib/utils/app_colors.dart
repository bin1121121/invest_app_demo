import 'package:flutter/material.dart';

class AppColors {
  static Color background = HexColor.hexColor("#F6F6F9");
  static Color black = HexColor.hexColor("#000000");
  static Color black1 = HexColor.hexColor("#333333");

  static Color white = HexColor.hexColor("#FFFFFF");
  static Color grey1 = HexColor.hexColor("#4F4F4F");
  static Color grey2 = HexColor.hexColor("#828282");
  static Color green = HexColor.hexColor("#31A062");
  static Color green1 = HexColor.hexColor("#31A078");
  static Color green2 = HexColor.hexColor("#31A05F");
  static Color green3 = HexColor.hexColor("#258B66");
  static Color yellow1 = HexColor.hexColor("#F0C735");
  static Color yellow2 = HexColor.hexColor("#D98F39");
  static Color red = HexColor.hexColor("#FE555D");
  static Color grey3 = HexColor.hexColor("#CAC9C9");
  static Color grey4 = HexColor.hexColor("#979797");
  static Color purple1 = HexColor.hexColor("#BA8DF3");
  static Color purple2 = HexColor.hexColor("#615EE2");
}

extension HexColor on Color {
  static Color hexColor(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
