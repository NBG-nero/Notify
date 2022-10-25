import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'package:notify/providers/theme_notifier.dart';
import 'package:notify/screens/home/home_screen_view_model.dart';
import 'package:notify/widgets/widgets.dart';

import '../../models/models.dart';
import '../../routes/router.gr.dart';
import '../../utilities/constants/constants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({
    Key? key,
  }) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context);
    return ViewModelBuilder<HomescreenViewModel>.reactive(
        viewModelBuilder: () => HomescreenViewModel(),
        onModelReady: (h) {
          h.setInitialised(true);
          h.getNotes();
        },
        builder: (context, model, child) {
          return Scaffold(
            drawer: CustomDrawer(
              filterByTitle: () {
                model.sortByTitle();
              },
              filterByNote: () {
                model.sortByNote();
              },
              filterByDate: () {
                model.sortByDate();
              },
              filterByID: () {
                model.sortById();
              },
              onDeleteAll: () {
                model.deleteAll();
              },
            ),
            appBar: AppBar(
              title: Text(
                'Notify',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: 24.sp),
              ),
              centerTitle: true,
              elevation: 10,
              backgroundColor: NColors.primaryColor,
              actions: [
                // ignore: sized_box_for_whitespace
                Container(
                    height: 20.h,
                    width: 60.w,
                    child: ElevatedButton(
                      onPressed: () {
                        if (model.switchView == false) {
                          model.setView(true);
                        } else {
                          model.setView(false);
                        }
                      },
                      child: !model.switchView == true
                          ? Icon(Icons.list_alt_outlined, size: 25.sp)
                          : Icon(Icons.grid_view_outlined, size: 26.sp),
                    )),
              ],
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              color: NColors.tertiaryolor,
              child: SingleChildScrollView(
                  child: model.switchView == false
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.notes.length,
                          itemBuilder: (context, index) {
                            Note note = model.notes[index];

                            return NotesCard(
                              note: note,
                              onTap: () {},
                              onDTap: () {
                                model.delNote(note.id!);
                              },
                              onVTap: () {
                                AutoRouter.of(context)
                                    .push(ViewNotescreen(note: note));
                              },
                              onETap: () {
                                AutoRouter.of(context)
                                    .push(EditNotescreen(note: note));
                              },
                            );
                          },
                        )
                      : SizedBox( 
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2.w,
                                    mainAxisSpacing: 2.w),
                            itemCount: model.notes.length,
                            itemBuilder: ((context, index) {
                              Note note = model.notes[index];
                              return NotesCard(
                                note: note,
                                onTap: () {},
                                onDTap: () {
                                  model.delNote(note.id!);
                                },
                                onVTap: () {
                                  AutoRouter.of(context)
                                      .push(ViewNotescreen(note: note));
                                },
                                onETap: () {
                                  AutoRouter.of(context)
                                      .push(EditNotescreen(note: note));
                                },
                              );
                            })),
                      )),
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: 'New Note',
              onPressed: () {
                AutoRouter.of(context).push(AddNotescreen(note: model.note));
              },
              // backgroundColor: Colors.blue,
              child: Icon(Icons.note_add, size: 30.h, color: Colors.white),
            ),
          );
        });
  }
}
