import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import '../screens/screens.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page, Route',
  routes: <AutoRoute>[
    AutoRoute(page: Homescreen, initial: true),
    AutoRoute(page: AddNotescreen),
    AutoRoute(page: ViewNotescreen),
  ],
)
class $AppRouter {}
