import 'package:auto_route/auto_route.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

// import 'package:notify/providers/theme_notifier.dart';
import 'package:notify/screens/home/home_screen_view_model.dart';
import 'package:notify/widgets/widgets.dart';

import '../../models/models.dart';
import '../../routes/router.gr.dart';
import '../../utilities/constants/constants.dart';
import '../../widgets/grid_tile.dart';

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
    // final theme = Provider.of<ThemeNotifier>(context);
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
                // model.setFilter(0);
                model.sortByTitle();
              },
              filterByNote: () {
                //  model.setFilter(1);
                model.sortByNote();
              },
              filterByDate: () {
                //  model.setFilter(2);
                model.sortByDate();
              },
              filterByID: () {
                //  model.setFilter(3);
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
                      child: model.switchView == true
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
                      : Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            right: 6,
                            left: 6,
                          ),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.9,
                              child: SingleChildScrollView(
                                child: StaggeredGrid.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 2.w,
                                  crossAxisSpacing: 2.w,
                                  children: [
                                    for (int i = 0;
                                        i < model.notes.length;
                                        i++,) ...[
                                      // Note note =  model.notes[i];
                                      StaggeredGridTile.count(
                                        crossAxisCellCount: 1,
                                        // i.isEven &&// i % 3 == 0//     ? 2//     : i % 4 == 0 // ? 2//         : 1,
                                        mainAxisCellCount:
                                            i.isEven || i % 3 == 0
                                                ?
                                                // 1
                                                (i.isOdd ? 1 : 2)
                                                : 1.4,
                                        child: Tile(
                                            model: model,
                                            index: i,
                                            descHeight: i.isEven || i % 3 == 0
                                                ? (i.isOdd ? 100.h : 320.h)
                                                : 180.h),
                                      ),
                                    ],
                                  ],
                                ),
                              )),
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
