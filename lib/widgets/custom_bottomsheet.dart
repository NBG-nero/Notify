import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:notify/widgets/color_slider.dart';
import 'package:stacked/stacked.dart';

import '../models/models.dart';
import '../screens/view_note/view_note_view_model.dart';

class NoteBottomSheet extends StatefulWidget {
  final Color? bottomsheetColor;
  final Note? note;
  const NoteBottomSheet({
    Key? key,
    this.bottomsheetColor,
    this.note,
  }) : super(key: key);

  @override
  State<NoteBottomSheet> createState() => _NoteBottomSheetState();
}

class _NoteBottomSheetState extends State<NoteBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewNoteViewModel>.reactive(
        viewModelBuilder: () => ViewNoteViewModel(),
        onModelReady: (v) {
          v.setInitialised(true);

          
        },
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  color: model.selectedColor,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(25)),
                ),
                height: 150.h,
                child: Center(
                  child: SizedBox(
                    height: 100.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ColorSlider(
                        sliderColor: model.selectedColor,
                        // onColorTapped:
                        //     model.changeTappedColor(model.indexOfCurrentColor!),
                      ),
                    ),
                  ),
                )),
          );
        });
  }
}
