import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/widgets/custom_pop_up_menu.dart';
import 'package:provider/provider.dart';



import '../providers/theme_notifier.dart';
import '../utilities/constants/constants.dart';

class CustomDrawer extends StatefulWidget {
  final GestureTapCallback? filterByTitle;
  final GestureTapCallback? filterByNote;
  final GestureTapCallback? filterByDate;
  final GestureTapCallback? filterByID;
  final GestureTapCallback? onDeleteAll;

  const CustomDrawer({
    Key? key,
    this.filterByTitle,
    this.filterByNote,
    this.filterByDate,
    this.filterByID,
    this.onDeleteAll,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context);
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text(''),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Filter'),
                      CustomPopupMenu(
                        onSortbyT: () {
                          widget.filterByTitle!();
                          // model.sortByTitle();
                        },
                        onSortbyN: () {
                          widget.filterByNote!();
                          // model.sortByNote();
                        },
                        onSortbyD: () {
                          widget.filterByDate!();
                          // model.sortByDate();
                        },
                        onSortbyI: () {
                          widget.filterByID!();
                          // model.sortById();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Delete All'),
                      InkWell(
                          onTap: () {
                            widget.onDeleteAll!();
                            // model.deleteAll();
                          },
                          child:
                              Icon(Icons.delete_forever_rounded, size: 28.h)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Theme'),
                      Transform.scale(
                        scale: 0.47,
                        child: CupertinoSwitch(
                          activeColor: NColors.primaryColor,
                          value: theme.darkTheme,
                          onChanged: (bool value) {
                            theme.toggleTheme();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
