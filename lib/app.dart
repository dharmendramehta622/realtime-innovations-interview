
import 'package:common_widget/common_widget.dart';
import 'package:mainapp/mainapp.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      child: ToastificationWrapper(
        child: MaterialApp.router(
          title: 'RealTime Innovations',
          debugShowCheckedModeBanner: kDebugMode,
          routeInformationParser: GoRoutes.router.routeInformationParser,
          routeInformationProvider: GoRoutes.router.routeInformationProvider,
          routerDelegate: GoRoutes.router.routerDelegate, 
          theme: ThemeData(
            scaffoldBackgroundColor: kWhite,
            textTheme: GoogleFonts.robotoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
        ),
      ),
    );
  }
}
