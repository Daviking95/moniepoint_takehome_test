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

    initMixpanel();
  }
}

Future<void> initMixpanel() async {
  AppData.mixpanel = await Mixpanel.init(dotenv.get('MIXPANEL_TOKEN'),
      trackAutomaticEvents: true);
}
