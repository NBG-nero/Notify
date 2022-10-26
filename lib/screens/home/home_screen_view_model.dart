import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';

class HomescreenViewModel extends BaseViewModel {
  HomescreenViewModel() {
    loadfromPrefs();
    loadfilterFromprefs();
  }

  final String views = 'noteviews';
  List<Note> notes = <Note>[];
  Note? note;
  SharedPreferences? prefs;
  bool switchView = false;
  final String filter = 'notesfilter';
  int? selectedValue ;

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  setView(value) {
    switchView = value;
    saveToprefs();
    notifyListeners();
  }

  saveToprefs() async {
    await initPrefs();
    prefs?.setBool(views, switchView);
  }

  loadfromPrefs() async {
    await initPrefs();

    switchView = prefs?.getBool(views) ?? false;

    notifyListeners();
  }

  setFilter(val) {
    selectedValue = val;
    savefiltterToprefs();
    notifyListeners();
  }

  savefiltterToprefs() async {
    await initPrefs();
    prefs?.setInt(filter, selectedValue!);
    notifyListeners();
  }

  loadfilterFromprefs() async {
    await initPrefs();
    selectedValue = prefs?.getInt(filter) ?? 0;
    notifyListeners();
  }

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

  deleteAll() async {
    log('clear all notes');
    var hiveBox = Hive.box<Note>(noteBox);
    await hiveBox.clear();
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
    for (note in notes) {
      // ignore: unused_local_variable
      String? formattedDate = note!.dateCreated!.toIso8601String();
      String? newFormattedDate = note!.updatedDate!.toIso8601String();
      // log(formattedDate);
      // log(newFormattedDate);
      formattedDate = newFormattedDate;
      note!.altDate = newFormattedDate = formattedDate;
      log(note!.altDate.toString());
      notes.sort((a, b) {
        String aDate = DateTime.tryParse(a.altDate ?? '').toString();
        String bDate = DateTime.tryParse(b.altDate ?? '').toString();
        return aDate.compareTo(bDate);
      });
      notifyListeners();
    }
  }

  sortById() {
    notes.sort(((a, b) => a.id!.toLowerCase().compareTo(b.id!.toLowerCase())));
    notifyListeners();
  }
}
