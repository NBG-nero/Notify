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
            backgroundColor: NColors.primaryColor,
            appBar: AppBar(
              title: const Text('Notify'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: ListView.builder(
              itemCount: model.notes.length,
              itemBuilder: (context, index) {
                Note note = model.notes[index];
                return NotesCard(
                  note: note,
                  onTap: () {},
                );
              },
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
