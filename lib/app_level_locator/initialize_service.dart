part of 'package:moniepoint_mobile/app_level_locator/exports.dart';

class InitializeServices {
  static setupFunctions() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // await dotenv.load(fileName: ".env");

  }
}
