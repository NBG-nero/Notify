
import 'package:hive_flutter/hive_flutter.dart';

import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';

class AddNoteViewModel extends BaseViewModel {
  var uuid = const Uuid();
  bool? complete = false;
  Note? note;

  setComplete(value) {
    note?.complete = complete;
    complete = value;
    notifyListeners();
  }

  String? addNote({required String title, required String desc}) {
    Note note = Note(title: title, desc: desc, complete: false, id: uuid.v4());
    var hiveBox = Hive.box<Note>(noteBox);
    hiveBox.put(note.id, note);
    
    return note.id;
  }


  
}
