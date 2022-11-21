import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorNotifier extends ChangeNotifier {
  SharedPreferences? prefs;
  final String colorR = 'notecolor';
  String? strSelected;
  Color? selectedColor;

  final check = Icon(
    Icons.check,
    size: 20.h,
  );

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  ColorNotifier() {
    loadNotecolorFromprefs();
  }

  saveNotecolorToprefs() async {
    await initPrefs();
    String? strSelected = selectedColor.toString();
    prefs?.setString(colorR, strSelected);
    log(strSelected);
  }

  loadNotecolorFromprefs() async {
    await initPrefs();

    strSelected = prefs?.getString(colorR);
    log(strSelected!);
    notifyListeners();
  }

  List<Color?> colors = [
    const Color(0xffffffff), // classic white
    const Color(0xfff28b81), // light pink
    const Color(0xfff7bd02), // yellow
    const Color(0xfffbf476), // light yellow
    const Color(0xffcdff90), // light green
    const Color(0xffa7feeb), // turquoise
    const Color(0xffcbf0f8), // light cyan
    const Color(0xffafcbfa), // light blue
    const Color(0xffd7aefc), // plum
    const Color(0xfffbcfe9), // misty rose
    const Color(0xffe6c9a9), // light brown
    const Color(0xffe9eaee) // light gray
  ];

  setColor(Color newColor) {
    selectedColor = newColor;
    saveNotecolorToprefs();
    notifyListeners();
    log(selectedColor.toString());
  }

  Widget checkOrNot(val) {
    if (selectedColor == val) {
      return check;
    }
    return Container();
  }
}
