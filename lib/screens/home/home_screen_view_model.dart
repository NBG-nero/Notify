import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';

class HomescreenViewModel extends BaseViewModel {
  List<Note> notes = <Note>[];
  Note? note;

  getNotes() {
    var hiveBox = Hive.box<Note>(noteBox);
    notes = hiveBox.values.toList();
    notifyListeners();
  }

  delNote(String id) async {
    log('method tapped');
    var hiveBox = Hive.box<Note>(noteBox);
    await hiveBox.delete(id);
    log(id);
    getNotes();

    notifyListeners();
  }

  getAnote(String id) {
    var hiveBox = Hive.box<Note>(noteBox);
    note = hiveBox.get(id);
    log(id);
    return note;
  }

  sortByTitle() {
    notes.sort(
        ((a, b) => a.title!.toLowerCase().compareTo(b.title!.toLowerCase())));
    notifyListeners();
  }

  sortByNote() {
    notes.sort(
        ((a, b) => a.desc!.toLowerCase().compareTo(b.desc!.toLowerCase())));
    notifyListeners();
  }

  sortByDate() {
    // date = (Note().dateCreated = Note().updatedDate)!;
    notes.sort(((a, b) => a.dateCreated!
        .toIso8601String()
        .compareTo(b.dateCreated!.toIso8601String())));
    notifyListeners();
  }
}
