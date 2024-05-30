import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // LIGHT THEME COLORS
  static const Color lightBackground = Colors.white;

  // PRIMARY ACCENT DOESN'T CHANGE WHEN THEME COLORS CHANGES
  static const Color primary = Color(0xffff2e2e);
  static const Color secondary = Color(0xff0e1c4f);

  static const Color lighterGray = Color(0xfff8f8f8);
  static const Color lightGray = Color(0xfff1f1f1);
  static const Color gray = Color(0xffe1e1e1);
  static const Color darkGray = Color(0xff919191);
  static const Color darkerGray = Color(0xff717171);
  static const Color darkestGray = Color(0xff515151);
  static const Color deepDarkGray = Color.fromARGB(255, 40, 40, 40);

  static const Color orange = Color.fromARGB(255, 254, 192, 0);
  static const Color red = Color.fromARGB(255, 250, 108, 81);
  static const Color green = Color.fromARGB(255, 158, 210, 106);
  static const Color blue = Color.fromARGB(255, 94, 156, 234);

  static Color stringColor(String string) {
    Color color = Colors.black;
    if (string.toLowerCase() == "цагаан") {
      color = Colors.white;
    } else if (string.toLowerCase() == "бор") {
      color = Colors.brown;
    } else if (string.toLowerCase() == "улаан") {
      color = Colors.red;
    } else if (string.toLowerCase() == "улбаршар") {
      color = Colors.orange;
    } else if (string.toLowerCase() == "шар") {
      color = Colors.yellow;
    } else if (string.toLowerCase() == "ногоон") {
      color = Colors.green;
    } else if (string.toLowerCase() == "цэнхэр") {
      color = Colors.blue;
    } else if (string.toLowerCase() == "хар") {
      color = Colors.black;
    } else if (string.toLowerCase() == "ягаан") {
      color = Colors.pink;
    } else if (string.toLowerCase() == "саарал") {
      color = Colors.grey;
    }
    return color;
  }

  static Color color(userType) {
    Color color = const Color.fromARGB(255, 254, 192, 0);
    if (userType == 1) {
      color = const Color.fromARGB(255, 250, 108, 81);
    } else if (userType == 2) {
      color = const Color.fromARGB(255, 158, 210, 106);
    } else if (userType == 3) {
      color = const Color.fromARGB(255, 94, 156, 234);
    }

    return color;
  }
}
