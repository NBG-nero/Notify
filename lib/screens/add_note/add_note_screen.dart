// ignore_for_file: sized_box_for_whitespace

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/screens/add_note/add_note_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../routes/router.gr.dart';
import '../../utilities/constants/constants.dart';
import '../../widgets/widgets.dart';

class AddNotescreen extends StatefulWidget {
  final Note? note;
  const AddNotescreen({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<AddNotescreen> createState() => _AddNotescreenState();
}

class _AddNotescreenState extends State<AddNotescreen>
    with TickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  AnimationController? animeCtrl;
  Animation<int>? anime;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddNoteViewModel>.reactive(
        viewModelBuilder: () => AddNoteViewModel(),
        onModelReady: (a) {
          a.setInitialised(true);
          animeCtrl = AnimationController(
              vsync: this, duration: const Duration(milliseconds: 400));
          anime = IntTween(begin: 0, end: 255).animate(animeCtrl!);
          anime?.addListener(() {
            setState(() {});
          });
          animeCtrl!.forward();
        },
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                  title: Text(
                    'Add Note',
                    style: Theme.of(context).textTheme.headline2?.copyWith(),
                  ),
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
                  centerTitle: false,
                  elevation: 10,
                  backgroundColor: NColors.primaryColor.withOpacity(0.8)),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Material(
                    color: model.selectedColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: formKey,
                        child: ListView(children: [
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
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                tooltip: 'Add Note',
                label: Text('Add Note',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.white)),
                onPressed: () {
                  model.addNote(title: titleCtrl.text, desc: descCtrl.text);

                  AutoRouter.of(context).pushAndPopUntil(const Homescreen(),
                      predicate: (route) => false);
                },
                // backgroundColor: NColors.tertiaryolor,
                icon: Icon(
                  Icons.add,
                  size: 30.h,
                ),
              ),
              bottomSheet: BottomSheet(
                  animationController: animeCtrl,
                  onDragStart: (details) {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(color: Colors.red);
                        });
                  },
                  onDragEnd: ((details, {isClosing = true}) {
                    Navigator.of(context).pop();
                  }),
                  backgroundColor: Colors.green,
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25))),
                  onClosing: () {},
                  builder: (context) {
                    return Container(
                      height: 20.h,
                    );
                  })
              // bottomSheet: ClipRRect(
              //   // borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
              //   child: Material(
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
              //                         // width:50.w,
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
              //                                     height: 34.h,
              //                                     width: 34.w,
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
              //           decoration: const BoxDecoration(
              //             color: Colors.blue,
              //             // borderRadius: BorderRadius.only(topLeft: Radius.circular(25))
              //           ),
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
