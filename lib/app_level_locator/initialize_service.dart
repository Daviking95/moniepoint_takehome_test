part of 'package:peerlendly/app_level_locator/exports.dart';

class InitializeServices {
  static setupFunctions() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    await AppPreferences.init();

    NetworkService.refreshToken();

    await Firebase.initializeApp();

    await dotenv.load(fileName: ".env");
  }
}
