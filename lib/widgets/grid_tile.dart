import 'package:flutter/material.dart';

import 'package:notify/screens/home/home_screen_view_model.dart';
import 'package:notify/widgets/widgets.dart';

class Tile extends StatefulWidget {
 final HomescreenViewModel model;
  final int index;
  const Tile({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    var notes = widget.model.notes;
    return GridNotesCard(
      note: notes[widget.index],
      
    );
  }
}
