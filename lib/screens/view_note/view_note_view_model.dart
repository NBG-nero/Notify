import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../models/models.dart';

class ViewNoteViewModel extends BaseViewModel {
  Note? note;
  // void Function(Color)? callBackColorTapped;
  final check = const Icon(Icons.check);
  // List<Note> notes = <Note>[];
  Color? selectedColor;
  int? indexOfCurrentColor;

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

  changeColor() {
    for (selectedColor in colors) {
      var changedCol = colors.indexOf(selectedColor);
      setSelectedColor(colors[changedCol]);
    }
    notifyListeners();
  }

  setSelectedColor(valColor) {
    // colors[3] = valColor;
    selectedColor = valColor;
    notifyListeners();
  }

  changeTappedColor(int indexofColor) {
    // selectedColor = colors[indexofColor];
    indexOfCurrentColor = indexofColor;
    setSelectedColor(colors[indexOfCurrentColor!]);
    // callBackColorTapped!(colors[indexofColor]);

    notifyListeners();
  }

  Widget checkOrNot(int index) {
    if (indexOfCurrentColor == index) {
      return check;
    }
    return Container();
  }
}
