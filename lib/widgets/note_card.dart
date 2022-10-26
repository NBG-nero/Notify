// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:notify/utilities/constants/constants.dart';


import '../models/models.dart';


class NotesCard extends StatefulWidget {
  final Note note;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDTap;
  final GestureTapCallback? onETap;
  final GestureTapCallback? onVTap;

  const NotesCard({
    Key? key,
    required this.note,
    this.onTap,
    this.onDTap,
    this.onETap,
    this.onVTap,
  }) : super(key: key);

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    String? formattedDate =
        DateFormat.yMEd().format(widget.note.dateCreated ?? DateTime.now());
    String? upDatedFormatDate =
        DateFormat.yMEd().format(widget.note.updatedDate ?? DateTime.now());

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          elevation: 30,
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.only(top:10,right:10,left:10),
            height: 180.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
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
                          fontSize: 12.sp, color: NColors.primaryColor),
                    ),
                  ],
                ),
                Container(
                  height: 88.h,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                widget.note.title ?? "New Note",
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.headline2?.copyWith(),
                                
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            widget.note.desc ?? "Description",
                            // overflow: TextOverflow.ellipsis,
                            style: textTheme.subtitle2?.copyWith()
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 2,
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 40.w,
                    right: 40.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: widget.onVTap,
                          child: Icon(Icons.visibility_outlined, size: 22.sp)),
                      InkWell(
                          onTap: widget.onETap,
                          child: Icon(Icons.edit, size: 22.sp)),
                      InkWell(
                          onTap: widget.onDTap,
                          child: Icon(Icons.delete, size: 22.sp)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
