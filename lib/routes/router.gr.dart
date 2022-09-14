// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i4;
import 'package:flutter/material.dart' as _i3;

import '../models/models.dart' as _i5;
import '../screens/screens.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    Homescreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Homescreen());
    },
    AddNotescreen.name: (routeData) {
      final args = routeData.argsAs<AddNotescreenArgs>(
          orElse: () => const AddNotescreenArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.AddNotescreen(key: args.key, note: args.note));
    },
    ViewNotescreen.name: (routeData) {
      final args = routeData.argsAs<ViewNotescreenArgs>(
          orElse: () => const ViewNotescreenArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.ViewNotescreen(key: args.key, note: args.note));
    },
    EditNotescreen.name: (routeData) {
      final args = routeData.argsAs<EditNotescreenArgs>(
          orElse: () => const EditNotescreenArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.EditNotescreen(key: args.key, note: args.note));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(Homescreen.name, path: '/'),
        _i2.RouteConfig(AddNotescreen.name, path: '/add-notescreen'),
        _i2.RouteConfig(ViewNotescreen.name, path: '/view-notescreen'),
        _i2.RouteConfig(EditNotescreen.name, path: '/edit-notescreen')
      ];
}

/// generated route for
/// [_i1.Homescreen]
class Homescreen extends _i2.PageRouteInfo<void> {
  const Homescreen() : super(Homescreen.name, path: '/');

  static const String name = 'Homescreen';
}

/// generated route for
/// [_i1.AddNotescreen]
class AddNotescreen extends _i2.PageRouteInfo<AddNotescreenArgs> {
  AddNotescreen({_i4.Key? key, _i5.Note? note})
      : super(AddNotescreen.name,
            path: '/add-notescreen',
            args: AddNotescreenArgs(key: key, note: note));

  static const String name = 'AddNotescreen';
}

class AddNotescreenArgs {
  const AddNotescreenArgs({this.key, this.note});

  final _i4.Key? key;

  final _i5.Note? note;

  @override
  String toString() {
    return 'AddNotescreenArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [_i1.ViewNotescreen]
class ViewNotescreen extends _i2.PageRouteInfo<ViewNotescreenArgs> {
  ViewNotescreen({_i4.Key? key, _i5.Note? note})
      : super(ViewNotescreen.name,
            path: '/view-notescreen',
            args: ViewNotescreenArgs(key: key, note: note));

  static const String name = 'ViewNotescreen';
}

class ViewNotescreenArgs {
  const ViewNotescreenArgs({this.key, this.note});

  final _i4.Key? key;

  final _i5.Note? note;

  @override
  String toString() {
    return 'ViewNotescreenArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [_i1.EditNotescreen]
class EditNotescreen extends _i2.PageRouteInfo<EditNotescreenArgs> {
  EditNotescreen({_i4.Key? key, _i5.Note? note})
      : super(EditNotescreen.name,
            path: '/edit-notescreen',
            args: EditNotescreenArgs(key: key, note: note));

  static const String name = 'EditNotescreen';
}

class EditNotescreenArgs {
  const EditNotescreenArgs({this.key, this.note});

  final _i4.Key? key;

  final _i5.Note? note;

  @override
  String toString() {
    return 'EditNotescreenArgs{key: $key, note: $note}';
  }
}
