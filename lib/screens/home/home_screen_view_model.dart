import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';


class HomescreenViewModel extends BaseViewModel {
  List<Note> notes = <Note>[];
  Note? note;

  Comparator<Note> sortById = ((a, b) => a.id!.compareTo(b.id!));

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
}
