import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/screens/add_note/add_note_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../routes/router.gr.dart';
import '../../utilities/constants/constants.dart';

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
              backgroundColor: NColors.secondaryColor,
              appBar: AppBar(
                title: Text('Add Note'),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Title',
                          hintStyle: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54),
                        ),
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 3,
                        controller: titleCtrl,
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Description',
                          hintStyle: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54),
                        ),
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                        maxLines: 1000,
                        controller: descCtrl,
                      )
                    ]),
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  model.addNote(title: titleCtrl.text, desc: descCtrl.text);

                  AutoRouter.of(context).push(const Homescreen());
                },
                backgroundColor: Colors.white54,
                child: Icon(Icons.add, size: 30.h, color: Colors.blue.shade900),
              ));
        });
  }
}
