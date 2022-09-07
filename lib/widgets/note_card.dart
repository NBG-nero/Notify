import 'package:flutter/material.dart';

import '../models/models.dart';

class NotesCard extends StatefulWidget {
  final Note note;
  const NotesCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 10,
        child: Container(),
      ),
    );
  }
}
