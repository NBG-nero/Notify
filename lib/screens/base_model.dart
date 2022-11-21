import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../models/models.dart';

class BaseModel extends BaseViewModel {
  SharedPreferences? prefs;
  // final String colorR = 'notecolor';
  // int? strSelected;
  Note? note;
  // Color? selectedColor;
  // int? indexOfCurrentColor;
  // // void Function(Color)? callBackColorTapped;
  // final check = Icon(
  //   Icons.check,
  //   size: 20.h,
  // );

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  // BaseModel() {
  //   loadNotecolorFromprefs();
  // }

  // saveNotecolorToprefs() async {
  //   await initPrefs();
  //   int? strSelected = selectedColor!.value;

  //   prefs?.setInt(colorR, strSelected);
  //   log(strSelected.toString());
  // }

  // loadNotecolorFromprefs() async {
  //   await initPrefs();
  //   // String? strSelected = selectedColor.toString();

  //   strSelected = prefs?.getInt(colorR);
  //   log(strSelected.toString());
  //   notifyListeners();
  // }

  // List<Color?> colors = [
  //   const Color(0xffffffff), // classic white
  //   const Color(0xfff28b81), // light pink
  //   const Color(0xfff7bd02), // yellow
  //   const Color(0xfffbf476), // light yellow
  //   const Color(0xffcdff90), // light green
  //   const Color(0xffa7feeb), // turquoise
  //   const Color(0xffcbf0f8), // light cyan
  //   const Color(0xffafcbfa), // light blue
  //   const Color(0xffd7aefc), // plum
  //   const Color(0xfffbcfe9), // misty rose
  //   const Color(0xffe6c9a9), // light brown
  //   const Color(0xffe9eaee) // light gray
  // ];

  // changeColor() {
  //   for (selectedColor in colors) {
  //     var changedCol = colors.indexOf(selectedColor);
  //     setSelectedColor(colors[changedCol]);
  //   }
  //   notifyListeners();
  // }

  // setSelectedColor(valColor) {
  //   // colors[3] = valColor;
  //   selectedColor = valColor;
  //   saveNotecolorToprefs();
  //   notifyListeners();
  // }

  // setColor(Color newColor) {
  //   selectedColor = newColor;
  //   notifyListeners();
  //   log(selectedColor.toString());
  // }

  // changeTappedColor(int indexofColor) {
  //   // selectedColor = colors[indexofColor];
  //   indexOfCurrentColor = indexofColor;
  //   setSelectedColor(colors[indexOfCurrentColor!]);
  //   // callBackColorTapped!(colors[indexofColor]);

  //   notifyListeners();
  // }

  // Widget checkOrNot(val) {
  //   if (selectedColor == val) {
  //     return check;
  //   }
  //   return Container();
  //   //   if (indexOfCurrentColor == index) {
  //   //     return check;
  //   //   }
  //   //   return Container();
  // }
}
