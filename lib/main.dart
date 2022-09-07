import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'models/models.dart';
import 'routes/router.gr.dart' as gr;
import 'utilities/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(noteBox);
  runApp(Notify());
}

class Notify extends StatelessWidget {
  Notify({Key? key}) : super(key: key);
  final appRouter = gr.AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: appRouter.delegate(),
            title: "Notify",
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: Builder(
                    builder: (context) => widget!,
                  ));
            },
          );
        });
  }
}
