import 'package:hive_flutter/hive_flutter.dart';

import 'package:uuid/uuid.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';
import '../base_model.dart';

class AddNoteViewModel extends BaseModel {
  var uuid = const Uuid();
  bool? complete = false;
 
  AddNoteViewModel() {
    loadNotecolorFromprefs();
  }

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
        noteColor: selectedColor);
    var hiveBox = Hive.box<Note>(noteBox);
    hiveBox.put(note.id, note);

    return note.id;
  }
}
