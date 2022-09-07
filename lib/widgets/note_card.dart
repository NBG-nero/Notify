import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/models.dart';

class NotesCard extends StatefulWidget {
  final Note note;
  final GestureTapCallback? onTap;
  const NotesCard({
    Key? key,
    required this.note,
    this.onTap,
  }) : super(key: key);

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: widget.onTap,
        child: Material(
          elevation: 10,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 100.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.note.title ?? "New Note",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(),
                        InkWell(
                          child: Icon(Icons.clear, size: 25.sp),
                          onTap: () {
                            // notesProvider.delNote(note.id!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.note.desc ?? "Description",
                  style: TextStyle(fontSize: 15.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
