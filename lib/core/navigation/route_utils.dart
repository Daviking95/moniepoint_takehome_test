part of 'package:nova/core/navigation/exports.dart';

class AppNavigator {
  static navigateRoute(
      {required BuildContext context,
      dynamic routeName,
      dynamic arguments,
      int routeType = 7,
      dynamic route}) {
    switch (routeType) {
      case 1:
        Navigator.pushNamed(context, routeName, arguments: arguments);
        break;
      case 2:
        Navigator.pop(context);
        break;
      case 3:
        Navigator.popAndPushNamed(context, routeName, arguments: arguments);
        break;
      case 4:
        Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false,
            arguments: arguments);
        break;
      case 5:
        Navigator.pushReplacementNamed(context, routeName,
            arguments: arguments);
        break;
      case 6:
        Navigator.popUntil(context, (route) => false);
        break;
      case 7:
        Navigator.push(context, CupertinoPageRoute(
          builder: (BuildContext context) {
            return route;
          },
        ));
        break;
      case 8:
        Navigator.pushNamed(context, routeName);
        break;
      case 9:
        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(
          builder: (BuildContext context) {
            return route;
          },
        ), (route) => false);
        break;
      case 10:
        Navigator.pushReplacement(context, CupertinoPageRoute(
          builder: (BuildContext context) {
            return route;
          },
        ));
        break;
      case 12:
        Navigator.maybePop(context);
        break;
      default:
        Navigator.pushNamed(context, routeName, arguments: arguments);
    }
  }

  static Future push(dynamic routeClass) {
    return Navigator.push(appGlobalNavKey.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass));
  }

  static void pushAndReplace(dynamic routeClass) {
    Navigator.pushReplacement(appGlobalNavKey.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass));
  }

  static void pushAndRemoveUtil(dynamic routeClass) {
    Navigator.pushAndRemoveUntil(appGlobalNavKey.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass), (route) => false);
  }

  //app context Navigator key and scaffold key
  static GlobalKey<NavigatorState> appGlobalNavKey =
      GlobalKey<NavigatorState>();
  static final BuildContext? appContext = appGlobalNavKey.currentContext;
  static GlobalKey<ScaffoldMessengerState> appScaffoldGlobalNavKey =
      GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<NavigatorState> appNavKey2 = GlobalKey<NavigatorState>();

  static void popScreen(BuildContext? context) {
    Navigator.pop(context ?? appContext!);
  }
}
