import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';
// import '../add_note/add_note_view_model.dart';

class HomescreenViewModel extends BaseViewModel {
  List<Note> notes = <Note>[];
  Note? note;

  Comparator<Note> sortById = ((a, b) => a.id!.compareTo(b.id!));

  getNotes() {
    var hiveBox = Hive.box<Note>(noteBox);
    notes = hiveBox.values.toList();
    notifyListeners();
  }

  // HomescreenViewModel() {
  //   AddNoteViewModel().addNote(title: 'New Note', desc: 'Description');
  // }
  delNote(String id) async {
    log('method tapped');
    var hiveBox = Hive.box<Note>(noteBox);
    await hiveBox.delete(id);
    log(id);
    getNotes();

    notifyListeners();
  }

  // editNote({String? id, String? title, String? desc, bool? complete}) async {
  //   var hiveBox = Hive.box<Note>(noteBox);
  //   hiveBox.get(note);
  //   editNote(
  //     id: note?.id,
  //     title: note?.title,
  //     desc: note?.desc,
  //     complete: note?.complete = false,
  //   );
  //   log(id!);
  //   return note?.id;
  // }
}
