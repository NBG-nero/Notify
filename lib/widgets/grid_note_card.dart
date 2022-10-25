// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';
import '../utilities/constants/constants.dart';

class GridNotesCard extends StatefulWidget {
  final Note note;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDTap;
  final GestureTapCallback? onETap;
  final GestureTapCallback? onVTap;
  const GridNotesCard({
    Key? key,
    required this.note,
    this.onTap,
    this.onDTap,
    this.onETap,
    this.onVTap,
  }) : super(key: key);

  @override
  State<GridNotesCard> createState() => _GridNotesCardState();
}

class _GridNotesCardState extends State<GridNotesCard> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    String? formattedDate =
        DateFormat.yMEd().format(widget.note.dateCreated ?? DateTime.now());
    String? upDatedFormatDate =
        DateFormat.yMEd().format(widget.note.updatedDate ?? DateTime.now());

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          elevation: 30,
          child: Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.note.title ?? "New Note",
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.headline2?.copyWith(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              height: 90.h,
                              child: SingleChildScrollView(
                                child: Text(widget.note.desc ?? "Description",
                                    // overflow: TextOverflow.ellipsis,
                                    style: textTheme.subtitle2?.copyWith()),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                widget.note.isEdited == false
                                    ? (widget.note.dateCreated == null
                                        ? formattedDate
                                        : DateFormat.yMEd()
                                            .format(widget.note.dateCreated!))
                                    : (widget.note.updatedDate == null
                                        ? upDatedFormatDate
                                        : DateFormat.yMEd()
                                            .add_jm()
                                            .format(widget.note.updatedDate!)),
                                style: textTheme.button?.copyWith(
                                    fontSize: 12.sp,
                                    color: NColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: widget.onVTap,
                          child: Icon(Icons.visibility_outlined, size: 20.sp)),
                      InkWell(
                          onTap: widget.onETap,
                          child: Icon(Icons.edit, size: 20.sp)),
                      InkWell(
                          onTap: widget.onDTap,
                          child: Icon(Icons.delete, size: 20.sp)),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}