part of 'package:nova/app_level_locator/exports.dart';

class PLApp extends StatelessWidget {
  const PLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NovaDependencies(
      child: InactivityHandler(
        child: ScreenUtilInit(
            designSize: const Size(430, 932),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return OverlaySupport.global(
                child: MaterialApp(
                  title: F.title,
                  navigatorKey: AppNavigator.appGlobalNavKey,
                  darkTheme: darkTheme,
                  theme: lightTheme,
                  themeMode: ThemeMode.system,
                  initialRoute: RouteGenerator.initialRoute,
                  onGenerateRoute: RouteGenerator.generateRoute,
                  debugShowCheckedModeBanner: false,
                ),
              );
            }),
      ),
    );
  }
}
