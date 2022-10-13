import 'package:flutter/material.dart';

class NColors {
  NColors._();
  static Color primaryColor = const Color(0xFF0D47A1);

  static Color secondaryColor = const Color.fromARGB(255, 101, 161, 203);
  static Color tertiaryolor = Colors.blue.shade50;
  static Color sideColor = const Color(0xFF27BAF2);

  static Map<int, Color> colorMap = {
    50: const Color.fromARGB(255, 227, 242, 253),
    100: const Color.fromARGB(255, 187, 222, 251),
    200: const Color.fromARGB(255, 144, 202, 249),
    300: const Color.fromARGB(255, 100, 181, 246),
    400: const Color.fromARGB(255, 66, 165, 245),
    500: const Color.fromARGB(255, 33, 150, 243),
    600: const Color.fromARGB(255, 30, 136, 229),
    700: const Color.fromARGB(255, 25, 118, 210),
    800: const Color.fromARGB(255, 21, 101, 192),
    900: const Color.fromARGB(255, 13, 71, 161),
  };
  static MaterialColor primaryColorswatch = MaterialColor(0xFF0D47A1, colorMap);
}
