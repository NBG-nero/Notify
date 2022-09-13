

import 'package:flutter/material.dart';

import '../../models/models.dart';

class ViewNotescreen extends StatefulWidget {
  final Note? note;
  const ViewNotescreen({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<ViewNotescreen> createState() => _ViewNotescreenState();
}

class _ViewNotescreenState extends State<ViewNotescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}