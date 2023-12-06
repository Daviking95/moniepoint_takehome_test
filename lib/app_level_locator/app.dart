part of 'package:peerlendly/app_level_locator/exports.dart';

class PLApp extends StatelessWidget {
  const PLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PLDependencies(
      child: InactivityHandler(
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return OverlaySupport.global(
                child: MaterialApp(
                  title: F.title,
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    LocalJsonLocalization.delegate,
                  ],
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
