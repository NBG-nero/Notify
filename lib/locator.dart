import 'package:get_it/get_it.dart';
import 'package:notify/providers/providers.dart';
import 'package:notify/screens/add_note/add_note_view_model.dart';
import 'package:notify/screens/base_model.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton<BaseModel>(() => BaseModel());
  locator.registerLazySingleton<AddNoteViewModel>(() => AddNoteViewModel());
  locator.registerLazySingleton<ColorNotifier>(() => ColorNotifier());
}
