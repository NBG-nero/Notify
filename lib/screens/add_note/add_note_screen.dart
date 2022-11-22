// ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/providers/providers.dart';
import 'package:notify/screens/add_note/add_note_view_model.dart';
import 'package:notify/screens/base_model.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
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

  @override
  Widget build(BuildContext context) {
    final colorNotifier = locator<ColorNotifier>();

    return ViewModelBuilder<AddNoteViewModel>.reactive(
        // viewModelBuilder: () => locator<AddNoteViewModel>(),
          viewModelBuilder: () => AddNoteViewModel(),
        onModelReady: (a) {
          a.setInitialised(true);
          // a.loadNotecolorFromprefs();
        },
        builder: (context, model, child) {
          return Consumer<ColorNotifier>(
              // stream: null,
              builder: (context, colorNotifier, child) {
            return Scaffold(
              // backgroundColor: locator<BaseModel>().selectedColor,
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
                  centerTitle: false,
                  elevation: 10,
                  backgroundColor: NColors.primaryColor.withOpacity(0.8)

                  ///this its where you should Look
                  ///i changed your basemodel to a class that extends changenotifi,
                  // backgroundColor: bm.selectedColor
                  ),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Material(
                    color: colorNotifier.selectedColor,
                    //  Color(model.strSelected ?? 0Xfffffff),
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
                // backgroundColor: locator<BaseModel>().selectedColor,
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
            );
          });
        });
  }
}
