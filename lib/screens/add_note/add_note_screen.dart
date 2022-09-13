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

class _AddNotescreenState extends State<AddNotescreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddNoteViewModel>.reactive(
        viewModelBuilder: () => AddNoteViewModel(),
        onModelReady: (a) {
          a.setInitialised(true);
        },
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                  title: Text(
                    'Add Note',
                    style: TextStyle(fontSize: 24.sp),
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
                  centerTitle: true,
                  elevation: 10,
                  backgroundColor: NColors.primaryColor.withOpacity(0.8)),
              body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: NColors.tertiaryolor,
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
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            controller: titleCtrl,
                            obscureText: false,
                            isMandatory: false),
                        SizedBox(height: 10.h),
                        LTextField(
                            labelText: 'Note',
                            hintText: 'enter note',
                            maxlines: 10,
                            maxlength: 2000,
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                            controller: descCtrl,
                            obscureText: false,
                            isMandatory: false),
                      ]),
                    ),
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  model.addNote(title: titleCtrl.text, desc: descCtrl.text);

                  AutoRouter.of(context).pushAndPopUntil(const Homescreen(),
                      predicate: (route) => false);
                },
                backgroundColor: Colors.white,
                child: Icon(Icons.add, size: 35.h, color: NColors.primaryColor),
              ));
        });
  }
}
