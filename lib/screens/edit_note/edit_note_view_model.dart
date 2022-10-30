import 'package:hive_flutter/hive_flutter.dart';
import 'package:notify/screens/view_note/view_note_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';

class EditNoteViewModel extends BaseViewModel {
  
  Note? note;
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
        updatedDate: DateTime.now());
    var hiveBox = Hive.box<Note>(noteBox);
    hiveBox.put(updateNote.id, updateNote);
    // log(id!);
    return updateNote.id;
  }
}
