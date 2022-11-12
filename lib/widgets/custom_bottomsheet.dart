// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

// import 'package:notify/screens/add_note/add_note_view_model.dart';

import '../screens/base_model.dart';

class NbottomSheet extends StatelessWidget {
  const NbottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        onModelReady: (b) {
          b.setInitialised(true);
        },
        builder: (context, model, child) {
          return Container(
              height: 150.h,
              decoration: BoxDecoration(
                  color: model.selectedColor,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(25))),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.colors.length,
                itemBuilder: (context, index) {
                  Color? color = model.colors[index];
                  return Center(
                    child: Container(
                        height: 30.h,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Material(
                                color: model.selectedColor,
                                child: InkWell(
                                    onTap: () {
                                      model.setSelectedColor(color);
                                      
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
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
                                              child: model.checkOrNot(color))),
                                    ))))),
                  );
                },
              ));
        });
  }
}
