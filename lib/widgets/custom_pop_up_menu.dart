// ignore_for_file: avoid_print, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopupMenu extends StatefulWidget {
  final GestureTapCallback? onSortbyT;
  final GestureTapCallback? onSortbyN;
  final GestureTapCallback? onSortbyD;
  final GestureTapCallback? onSortbyI;
  const CustomPopupMenu({
    Key? key,
    this.onSortbyT,
    this.onSortbyN,
    this.onSortbyD,
    this.onSortbyI,
  }) : super(key: key);

  @override
  State<CustomPopupMenu> createState() => _CustomPopupMenuState();
}

class _CustomPopupMenuState extends State<CustomPopupMenu> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(),
          child: PopupMenuButton<int>(
            tooltip: 'Filter Notes',
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.menu,
              size: 25.h,
            ),
            onSelected: (int selectedValue) async {
              switch (selectedValue) {
                case 0:
                  widget.onSortbyT!();

                  break;
                case 1:
                  widget.onSortbyN!();
                  break;
                case 2:
                  widget.onSortbyD!();
                  break;
                case 3:
                  widget.onSortbyI!();
                  break;
                // case 4:
                //   print('Reported');
                //   break;
                // case 5:
                //   print('Only your friends can see this post');
                //   break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                height: 20.h,
                value: 0,
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Filter by Title',
                          style: textTheme.bodyText2?.copyWith(),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const Divider(
                      indent: 0,
                      endIndent: 0,
                      height: 1,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                height: 20.h,
                value: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Filter by Note',
                          style: textTheme.bodyText2?.copyWith(),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const Divider(
                      indent: 0,
                      endIndent: 0,
                      height: 1,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                height: 20.h,
                value: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            // width: size.width * 0.6,
                            child: Text(
                              'Filter by Date',
                              style: textTheme.bodyText2?.copyWith(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const Divider(
                      indent: 0,
                      endIndent: 0,
                      height: 1,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                height: 20.h,
                value: 3,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            // width: size.width * 0.6,
                            child: Text(
                              // 'Mute ${widget.post.userName!}',
                              'Filter by Id',
                              style: textTheme.bodyText2?.copyWith(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const Divider(
                      indent: 0,
                      endIndent: 0,
                      height: 1,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
