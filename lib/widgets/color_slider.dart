// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

// import '../models/models.dart';
import '../screens/view_note/view_note_view_model.dart';

class ColorSlider extends StatefulWidget {
  // final void Function(Color)? callBackColorTapped;

  final Color? sliderColor;
  final GestureTapCallback? onColorTapped;
  // final Note? note;
  const ColorSlider({
    Key? key,
    // this.callBackColorTapped,
    // this.note,
    this.sliderColor,
    this.onColorTapped,
  }) : super(key: key);

  @override
  State<ColorSlider> createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {
  final Color borderColor = const Color(0xffd3d3d3);
  final Color foregroundColor = const Color(0xff595959);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewNoteViewModel>.reactive(
        viewModelBuilder: () => ViewNoteViewModel(),
        onModelReady: (v) {
          v.setInitialised(true);

          // widget.noteColor = v.noteColor;

          // v.indexOfCurrentColor = v.colors.indexOf(v.noteColor!);
        
        },
        builder: (context, model, child) {
          return Container(
            color: 
            model.selectedColor,
            // widget.sliderColor,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.colors.length,
                itemBuilder: ((context, index) {
                  // Color color = model.colors[index];

                  // children: List.generate(model.colors.length, (index) {
                  return Center(
                    child: Container(
                      height: 60.h,

                      // color: color,
                      child: InkWell(
                          onTap: () {
                            model.changeTappedColor(index);
                            // widget.onColorTapped!();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: borderColor, shape: BoxShape.circle),
                              child: CircleAvatar(
                                foregroundColor: foregroundColor,
                                backgroundColor: model.colors[index],
                                child: model.checkOrNot(index),
                              ),
                            ),
                          )),
                    ),
                  );
                })),
          );
        });
  }
}
