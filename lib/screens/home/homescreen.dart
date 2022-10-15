import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/providers/theme_notifier.dart';
import 'package:notify/screens/home/home_screen_view_model.dart';
import 'package:notify/widgets/widgets.dart';
import 'package:provider/provider.dart';
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
    final theme = Provider.of<ThemeNotifier>(context);
    return ViewModelBuilder<HomescreenViewModel>.reactive(
        viewModelBuilder: () => HomescreenViewModel(),
        onModelReady: (h) {
          h.setInitialised(true);
          h.getNotes();
        },
        builder: (context, model, child) {
          return Scaffold(
            drawer: Drawer(
                child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  child: Text(''),
                ),
                ListTile(
              
                  trailing: Transform.scale(
                    scale: 0.6,
                    child: CupertinoSwitch(
                      activeColor: NColors.primaryColor,
                      value: theme.darkTheme,
                      onChanged: (bool value) {
                        theme.toggleTheme();
                      },
                    ),
                  ),
                  title: const Text('Theme'),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sort Notes'),
                      CustomPopupMenu(
                        onSortbyT: () {
                          model.sortByTitle();
                        },
                        onSortbyN: () {
                          model.sortByNote();
                        },
                        onSortbyD: () {
                          model.sortByDate();
                        },
                        onSortbyI: () {
                          model.sortById();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )),
            appBar: AppBar(
              title: Text(
                'Notify',
                style: TextStyle(fontSize: 24.sp),
              ),
              centerTitle: true,
              elevation: 10,
              backgroundColor: NColors.primaryColor,
              // actions: [
              //   CustomPopupMenu(
              //     onSortbyT: () {
              //       model.sortByTitle();
              //     },
              //     onSortbyN: () {
              //       model.sortByNote();
              //     },
              //     onSortbyD: () {
              //       model.sortByDate();
              //     },
              //     onSortbyI: () {
              //       model.sortById();
              //     },
              //   ),
              // ],
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
                        AutoRouter.of(context).push(ViewNotescreen(note: note));
                      },
                      onETap: () {
                        AutoRouter.of(context).push(EditNotescreen(note: note));
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
              backgroundColor: NColors.primaryColor,
              child: Icon(Icons.add, size: 30.h, color: Colors.white),
            ),
          );
        });
  }
}
