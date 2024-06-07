part of 'package:moniepoint_mobile/core/navigation/exports.dart';


class RouteGenerator {
  static const String initialRoute = AppRoutes.splash;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return buildRoute(const SplashScreen(), settings: settings);
      case AppRoutes.dashboard:
        return buildRoute(const HomeScreen(), settings: settings);
      case AppRoutes.persistentTab:
        return buildRoute(const FloatingTab(), settings: settings);
      default:
        return buildRoute(const SplashScreen(), settings: settings);
    }
  }

  static popScreen(BuildContext context) {
    Navigator.pop(context);
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => child);
  }
}