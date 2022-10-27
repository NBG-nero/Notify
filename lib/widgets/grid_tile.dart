import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:notify/screens/home/home_screen_view_model.dart';
import 'package:notify/widgets/widgets.dart';

import '../routes/router.gr.dart';

class Tile extends StatefulWidget {
  final GestureTapCallback? onDel;
  final GestureTapCallback? onEdit;
  final GestureTapCallback? onView;
  final HomescreenViewModel model;
  final int index;
  final dynamic descHeight;
  // final Note? note;
  const Tile({
    Key? key,
    this.onDel,
    this.onEdit,
    this.onView,
    required this.model,
    required this.index,
     this.descHeight,
  }) : super(key: key);

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    var notes = widget.model.notes;
    return GridNotesCard(
      descCardHeight: widget.descHeight,
      note: notes[widget.index],
      // note:widget.note!,
      onDTap: () {
        // widget.onDel!();
        widget.model.delNote(notes[widget.index].id!);
      },
      onETap: () {
        // widget.onEdit!();
        AutoRouter.of(context)
            .push(EditNotescreen(note: widget.model.notes[widget.index]));
      },
      onVTap: () {
        // widget.onView!();
        AutoRouter.of(context)
            .push(ViewNotescreen(note: widget.model.notes[widget.index]));
      },
    );
  }
}
