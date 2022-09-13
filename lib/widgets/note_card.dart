// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          elevation: 30,
          child: InkWell(
            onTap: widget.onTap,
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              height: 178.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: 90.h,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  widget.note.title ?? "New Note",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(),
                                  InkWell(
                                    onTap: widget.onDTap,
                                    child: Icon(Icons.clear, size: 25.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Text(
                              widget.note.desc ?? "Description",
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                  ),
                  SizedBox(height:5.h),
                  Padding(
                    padding:  EdgeInsets.only(left:40.w,right:40.w,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell( 
                          onTap:widget.onVTap,
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
      ),
    );
  }
}
