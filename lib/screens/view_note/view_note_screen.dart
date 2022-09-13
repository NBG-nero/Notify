import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/widgets/custom_textfield.dart';

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
  @override
  Widget build(BuildContext context) {
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
                  child: Icon(Icons.arrow_back_ios_new_rounded, size: 25.sp)),
            ),
          ),
          centerTitle: true,
          elevation: 10,
          backgroundColor: NColors.secondaryColor),
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: NColors.tertiaryolor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                LTextField(
                    labelText: 'Title',
                    hintText: 'enter title',
                    maxlines: 3,
                    obscureText: false,
                    isMandatory: false),
              ],
            ),
          )),
    );
  }
}
