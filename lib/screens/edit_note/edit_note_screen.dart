// ignore_for_file: sized_box_for_whitespace

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/providers/providers.dart';
import 'package:notify/screens/edit_note/edit_note_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../models/models.dart';
import '../../routes/router.gr.dart';
import '../../utilities/constants/constants.dart';
import '../../widgets/widgets.dart';

class EditNotescreen extends StatefulWidget {
  final Note? note;
  const EditNotescreen({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<EditNotescreen> createState() => _EditNotescreenState();
}

class _EditNotescreenState extends State<EditNotescreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final colorNotifier = locator<ColorNotifier>();
    // final colorNotifier = Provider.of<ColorNotifier>(context);

    return ViewModelBuilder<EditNoteViewModel>.reactive(
        viewModelBuilder: () => EditNoteViewModel(),
        onModelReady: (e) {
          e.setInitialised(true);

          titleCtrl.text = widget.note!.title ?? " ";
          descCtrl.text = widget.note!.desc ?? "";
          e.notifier.selectedColor = widget.note!.noteColor;
          log(e.notifier.selectedColor.toString());
          // log(colorNotifier.selectedColor.toString());
        },
        builder: (context, model, child) {
          final theme = Provider.of<ThemeNotifier>(context);

          return Scaffold(
            appBar: AppBar(
                title: Text(
                  'Edit Note',
                  style: Theme.of(context).textTheme.headline2?.copyWith(),
                ),
                centerTitle: false,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: AutoRouter.of(context).pop,
                        child: Icon(Icons.arrow_back_ios_new_rounded,
                            size: 25.sp)),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          // print(model.selectedColor.toString());
                          // locator<BaseModel>().selectedColor;

                          // print('color sheet');
                          showModalBottomSheet(
                              // backgroundColor: model.selectedColor,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25))),
                              builder: (context) {
                                return const NbottomSheet();
                              });
                        },
                        child: Icon(Icons.color_lens_outlined, size: 25.h)),
                  )
                ],
                elevation: 10,
                backgroundColor: NColors.primaryColor.withOpacity(0.5)),
            body: SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Material(
                    color: model.notifier.selectedColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            LTextField(
                                labelText: 'Title',
                                hintText: 'enter title',
                                maxlines: 1,
                                maxlength: 500,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(),
                                controller: titleCtrl,
                                obscureText: false,
                                isMandatory: false),
                            SizedBox(height: 10.h),
                            LTextField(
                                labelText: 'Note',
                                hintText: 'enter note',
                                maxlines: 10,
                                maxlength: 2000,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(),
                                controller: descCtrl,
                                obscureText: false,
                                isMandatory: false),
                            SizedBox(height: 30.h),
                            LButton(
                              minWidth: MediaQuery.of(context).size.width * 0.5,
                              onPressed: () {
                                model.updateNote(
                                    widget.note!.id,
                                    titleCtrl.text,
                                    descCtrl.text,
                                    widget.note!.dateCreated);

                                AutoRouter.of(context).pushAndPopUntil(
                                    const Homescreen(),
                                    predicate: (route) => false);
                              },
                              color: theme.darkTheme
                                  ? NColors.primaryColor
                                  : Colors.blueAccent,
                              buttontext: 'Save',
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            // bottomSheet: ClipRRect(
            //   child: Material(
            //     elevation: 50,
            //     child: InkWell(
            //       onTap: () {
            //         // setState(() {
            //         showModalBottomSheet(
            //             backgroundColor: model.selectedColor,
            //             context: context,
            //             shape: const RoundedRectangleBorder(
            //               borderRadius:
            //                   BorderRadius.vertical(top: Radius.circular(25)),
            //             ),
            //             builder: (BuildContext context) {
            //               return Container(
            //                 decoration: BoxDecoration(
            //                     color: model.selectedColor,
            //                     borderRadius: const BorderRadius.vertical(
            //                         top: Radius.circular(25))),
            //                 height: 150.h,
            //                 child: ListView.builder(
            //                   scrollDirection: Axis.horizontal,
            //                   itemCount: model.colors.length,
            //                   itemBuilder: ((context, index) {
            //                     Color? color = model.colors[index];
            //                     return Center(
            //                       child: Container(
            //                         height: 30.h,
            //                         // width:40.w,
            //                         child: ClipRRect(
            //                           borderRadius: BorderRadius.circular(25),
            //                           child: Material(
            //                             color: model.selectedColor,
            //                             child: InkWell(
            //                                 onTap: () {
            //                                   model.setSelectedColor(color);
            //                                   Navigator.of(context).pop();
            //                                   // model.changeTappedColor(index);
            //                                 },
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 8.0, right: 8),
            //                                   child: Container(
            //                                     height: 30.h,
            //                                     width: 30.w,
            //                                     padding:
            //                                         const EdgeInsets.all(2),
            //                                     decoration: const BoxDecoration(
            //                                         color: Colors.white,
            //                                         shape: BoxShape.circle),
            //                                     child: CircleAvatar(
            //                                       foregroundColor: Colors.grey,
            //                                       backgroundColor: color,
            //                                       child:
            //                                           model.checkOrNot(color),
            //                                     ),
            //                                   ),
            //                                 )),
            //                           ),
            //                         ),
            //                       ),
            //                     );
            //                   }),
            //                 ),
            //               );
            //             });
            //         // });
            //       },
            //       child: Container(
            //           height: 20.h,
            //           width: MediaQuery.of(context).size.width,
            //           color: Colors.blue,
            //           // widget.note!.noteColor,
            //           child: Center(
            //             child: ClipRRect(
            //               borderRadius: BorderRadius.circular(10),
            //               child: SizedBox(
            //                 height: 6.h,
            //                 width: 60.w,
            //                 child: Container(color: Colors.black),
            //               ),
            //             ),
            //           )),
            //     ),
            //   ),
            // ),
          );
        });
  }
}
