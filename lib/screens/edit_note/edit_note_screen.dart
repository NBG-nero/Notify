import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/screens/edit_note/edit_note_view_model.dart';
import 'package:stacked/stacked.dart';

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
    return ViewModelBuilder<EditNoteViewModel>.reactive(
        viewModelBuilder: () => EditNoteViewModel(),
        onModelReady: (e) {
          e.setInitialised(true);
          titleCtrl.text = widget.note!.title ?? " ";
          descCtrl.text = widget.note!.desc ?? "";
        },
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
                title: Text(
                  'Edit Note',
                 style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: 22.sp),
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
                backgroundColor: NColors.primaryColor.withOpacity(0.5)),
            body: SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
          
                  child: Material(
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
                            SizedBox(height: 30.h),
                            LButton(
                              onPressed: () {
                                model.updateNote(widget.note!.id, titleCtrl.text,
                                    descCtrl.text);
                             
                                AutoRouter.of(context).pushAndPopUntil(
                                    const Homescreen(),
                                    predicate: (route) => false);
                              },
                              color: NColors.primaryColor,
                              buttontext: 'Save',
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          );
        });
  }
}
