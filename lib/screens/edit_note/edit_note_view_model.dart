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

  

}
