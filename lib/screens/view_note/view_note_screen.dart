import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/screens/view_note/view_note_view_model.dart';
import 'package:notify/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';

class ViewNotescreen extends StatefulWidget {
  final Note? note;
  const ViewNotescreen({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<ViewNotescreen> createState() => _ViewNotescreenState();
}

class _ViewNotescreenState extends State<ViewNotescreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewNoteViewModel>.reactive(
        viewModelBuilder: () => ViewNoteViewModel(),
        onModelReady: (v) {
          v.setInitialised(true);
          titleCtrl.text = widget.note!.title ?? " ";
          descCtrl.text = widget.note!.desc ?? "";
        },
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
                title: Text(
                  'View Note',
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
                backgroundColor: NColors.secondaryColor),
            body: SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: NColors.tertiaryolor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          LTextField(
                              readOnly: true,
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
                              readOnly: true,
                              labelText: 'Note',
                              hintText: 'enter note',
                              maxlines: 10,
                              maxlength: 2000,
                              style: TextStyle(
                                fontSize: 18.sp,
                              ),
                              controller: descCtrl,
                              obscureText: false,
                              isMandatory: false)
                        ],
                      ),
                    ),
                  )),
            ),
          );
        });
  }
}