import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/screens/home/home_screen_view_model.dart';
import 'package:notify/widgets/widgets.dart';
import 'package:stacked/stacked.dart';

import '../../models/models.dart';
import '../../routes/router.gr.dart';
import '../../utilities/constants/constants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomescreenViewModel>.reactive(
        viewModelBuilder: () => HomescreenViewModel(),
        onModelReady: (h) {
          h.setInitialised(true);
          h.getNotes();
        },
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Notify',
                style: TextStyle(fontSize: 24.sp),
              ),
              centerTitle: true,
              elevation: 10,
              backgroundColor: NColors.primaryColor,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              color: NColors.tertiaryolor,
              child: SingleChildScrollView(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.notes.length,
                  itemBuilder: (context, index) {
                    Note note = model.notes[index];
                    // model.sortById;
                    // model.notes.sort(
                    //     ((a, b) => b.id!.compareTo(a.id!)));
                    return NotesCard(
                      note: note,
                      onTap: () {
                        // AutoRouter.of(context).pop();
                        // AutoRouter.of(context)
                        //     .push(AddNotescreen(note: model.note));
                        // model.editNote();
                      },
                      onDTap: () {
                        model.delNote(note.id!);
                      },
                      onVTap: () {
                        AutoRouter.of(context)
                            .push(AddNotescreen(note: model.note));
                        model.getAnote(note.id!);
                      },
                    );
                  },
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                AutoRouter.of(context).push(AddNotescreen(note: model.note));
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.add, size: 30.h, color: NColors.primaryColor),
            ),
          );
        });
  }
}
