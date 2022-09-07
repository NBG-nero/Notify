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
}
