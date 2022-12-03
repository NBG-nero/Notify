import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../locator.dart';
import '../models/models.dart';
import '../providers/providers.dart';

class BaseModel extends BaseViewModel {
  SharedPreferences? prefs;

  Note? note;
  // ColorNotifier? notifier;

  final notifier = locator<ColorNotifier>();


  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }


}
