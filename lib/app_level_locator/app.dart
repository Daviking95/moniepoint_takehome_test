part of 'package:moniepoint_mobile/app_level_locator/exports.dart';

class MonieEstateApp extends StatelessWidget {
  const MonieEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MonieEstateDependencies(
      child: ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: F.title,
              navigatorKey: AppNavigator.appGlobalNavKey,
              darkTheme: darkTheme,
              theme: lightTheme,
              themeMode: ThemeMode.system,
              home: const SplashScreen(),
              // initialRoute: RouteGenerator.initialRoute,
              onGenerateRoute: RouteGenerator.generateRoute,
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
