import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../utilities/constants/constants.dart';
import '../base_model.dart';

class EditNoteViewModel extends BaseModel {
  // EditNoteViewModel() {
  //   loadNotecolorFromprefs();
  // }

  

  // Note? note;
  bool? isEdited;
  setComplete(value) {
    note?.isEdited = isEdited;
    isEdited = value;
    notifyListeners();
  }

  saveNote(Note? note) {
    var hiveBox = Hive.box<Note>(noteBox);
    // hiveBox.putAt(note!.id!, value)
    hiveBox.delete(note!.id!);
    hiveBox.put(note.id, note);
  }

  updateNote(String? id, String? title, String? desc, dynamic dateCreated) {
    Note updateNote = Note(
        id: id,
        title: title,
        desc: desc,
        isEdited: true,
        dateCreated: dateCreated,
        updatedDate: DateTime.now(),
        noteColor: notifier.selectedColor);
    var hiveBox = Hive.box<Note>(noteBox);
    hiveBox.put(updateNote.id, updateNote);
    // log(id!);
    return updateNote.id;
  }
}
