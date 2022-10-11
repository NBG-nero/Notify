import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';

class HomescreenViewModel extends BaseViewModel {
  List<Note> notes = <Note>[];
  Note? note;
  // Comparator<Note> sortbyId = ((a, b) => a.id!.compareTo(b.id!));

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
    String? formattedDate =
        DateFormat.yMEd().format(note?.dateCreated ?? DateTime.now());
    String? upDatedFormatDate =
        DateFormat.yMEd().format(note?.updatedDate ?? DateTime.now());

    // note?.altDate == null
    //     ? (note?.dateCreated == null
    //         ? formattedDate
    //         : DateFormat.yMEd().format(note?.dateCreated ?? DateTime.now()))
    //     : (note?.updatedDate == null
    //         ? upDatedFormatDate
    //         : DateFormat.yMEd()
    //             .add_jm()
    //             .format(note?.updatedDate ?? DateTime.now()));
    note?.altDate = formattedDate;
    formattedDate = upDatedFormatDate;

    ///Null check operator used on a null value
    notes.sort(((a, b) => a.altDate!.compareTo(b.altDate!)));

    notifyListeners();
  }

  sortById() {
    notes.sort(((a, b) => a.id!.toLowerCase().compareTo(b.id!.toLowerCase())));
    notifyListeners();
  }
}
