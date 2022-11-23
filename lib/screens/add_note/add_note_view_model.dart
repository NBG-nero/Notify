import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notify/providers/color_notifier.dart';

import 'package:uuid/uuid.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';
import '../base_model.dart';

class AddNoteViewModel extends BaseModel {
  var uuid = const Uuid();
  bool? complete = false;

  // Color? selectedColor;

  // AddNoteViewModel() {
  //   loadNotecolorFromprefs();
  // }

  setComplete(value) {
    note?.complete = complete;
    complete = value;
    notifyListeners();
  }

  String? addNote({required String title, required String desc}) {
    Note note = Note(
        title: title,
        desc: desc,
        complete: false,
        id: uuid.v4(),
        isEdited: false,
        dateCreated: DateTime.now(),
        updatedDate: DateTime.now(),
        noteColor: notifier.selectedColor);
    var hiveBox = Hive.box<Note>(noteBox);
    hiveBox.put(note.id, note);

    return note.id;
  }

  // @override
  // setColor(Color newColor) {
  //   selectedColor = newColor;

  //   notifyListeners();
  //   saveNotecolorToprefs();
  //   log(selectedColor.toString());
  // }

  // @override
  // saveNotecolorToprefs() async {
  //   await initPrefs();
  //   int? strSelected = selectedColor!.value;

  //   prefs?.setInt(colorR, strSelected);
  //   log(strSelected.toString());
  // }

  // @override
  // loadNotecolorFromprefs() async {
  //   await initPrefs();
  //   // String? strSelected = selectedColor.toString();

  //   strSelected = prefs?.getInt(colorR);
  //   log(strSelected.toString());
  //   setColor(Color(strSelected!));
  //   notifyListeners();
  // }
}
