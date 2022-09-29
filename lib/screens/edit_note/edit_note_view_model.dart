

import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';

class EditNoteViewModel extends BaseViewModel {
  saveNote(Note? note) {
    var hiveBox = Hive.box<Note>(noteBox);
    // hiveBox.putAt(note!.id!, value)
    hiveBox.delete(note!.id!);
    hiveBox.put(note.id, note);
  }

  updateNote(String? id, String? title, String? desc) {
    Note updateNote = Note(id: id, title: title, desc: desc);
    var hiveBox = Hive.box<Note>(noteBox);
    hiveBox.put(updateNote.id, updateNote);
    // log(id!);
    return updateNote.id;
  }
}
