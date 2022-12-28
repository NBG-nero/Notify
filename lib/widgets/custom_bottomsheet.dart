// ignore_for_file: sized_box_for_whitespace

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

// import 'package:notify/screens/add_note/add_note_view_model.dart';

import '../locator.dart';
import '../providers/providers.dart';
import '../screens/add_note/add_note_view_model.dart';
import '../screens/base_model.dart';

class NbottomSheet extends StatefulWidget {
  const NbottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<NbottomSheet> createState() => _NbottomSheetState();
}

class _NbottomSheetState extends State<NbottomSheet> {
  @override
  Widget build(BuildContext context) {
    final colorNotifier = locator<ColorNotifier>();
    // final colorNotifier = Provider.of<ColorNotifier>(context);
    // return ViewModelBuilder<BaseModel>.reactive(
    //     disposeViewModel: false,
    //     viewModelBuilder: () => locator<AddNoteViewModel>(),
    //     onModelReady: (b) {
    //       // b.setInitialised(true);
    //     },
    //     builder: (context, colorNotifier, child) {

    // return Consumer<ColorNotifier>(
    //     // stream: null,
    //     builder: (context, colorNotifier, child) {
    return Container(
        height: 150.h,
        decoration: BoxDecoration(
            color: colorNotifier.selectedColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(25))),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colorNotifier.colors.length,
          itemBuilder: (context, index) {
            Color? color = colorNotifier.colors[index];
            return Center(
              child: Container(
                  height: 30.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Material(
                          color: colorNotifier.selectedColor,
                          child: InkWell(
                              onTap: () {
                                // colorNotifier.setSelectedColor(color);
                                colorNotifier.setColor(color!);
                                setState(() {
                                  // log(colorNotifier.selectedColor.toString());
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Container(
                                    height: 34.h,
                                    width: 34.w,
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: CircleAvatar(
                                        foregroundColor: Colors.grey,
                                        backgroundColor: color,
                                        child:
                                            colorNotifier.checkOrNot(color))),
                              ))))),
            );
          },
        ));

    // });

    // });
  }
}
