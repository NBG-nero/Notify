import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/models.dart';
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
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Edit Note',
            style: TextStyle(fontSize: 24.sp),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: AutoRouter.of(context).pop,
                  child: Icon(Icons.arrow_back_ios_new_rounded, size: 25.sp)),
            ),
          ),
          centerTitle: true,
          elevation: 10,
          backgroundColor: NColors.primaryColor.withOpacity(0.5)),
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
                        isMandatory: false),
                    SizedBox(height: 30.h),
                    LButton(
                      onPressed: () {
                        
                      },
                      color: NColors.primaryColor,
                      buttontext: 'Save', 
                      
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
