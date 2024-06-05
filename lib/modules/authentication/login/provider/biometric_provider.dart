part of 'package:nova/modules/authentication/login/exports.dart';

class BiometricProvider extends ChangeNotifier{
  static final LocalAuthentication localAuthentication = LocalAuthentication();

  static Future<bool> startBiometricLogin() async {
    if (AppPreferences.returnDetails.isEmpty && AppPreferences.activityPin.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> startBiometricTransactions() async {
    if (!await AppPreferencesUtils.readFromPref(PrefsConstants.biometricTransaction)) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> getBiometricsSupport() async {
    bool hasFingerPrintSupport = false;
    try {
      hasFingerPrintSupport = await localAuthentication.canCheckBiometrics;

      return hasFingerPrintSupport;
    } catch (e) {
      print(e);
      return hasFingerPrintSupport;
    }
  }

  static Future<void> getAvailableSupport() async {
    try {
      await localAuthentication.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> authenticateMe() async {
    bool authenticated = false;
    await getAvailableSupport();

    try {
      authenticated = await localAuthentication.authenticate(
        // sensitiveTransaction: true,
          localizedReason: "biometrics-auth-desc-text",
          options: const AuthenticationOptions(
              biometricOnly: true, useErrorDialogs: true, stickyAuth: true));

      return authenticated;
    } catch (e) {
      return authenticated;
    }
  }


  authenticateBiometrics(BuildContext context, Function()? callBack)async {

    try {
      if ((await AppPreferencesUtils.readFromPref(PrefsConstants.userEmail) && !await AppPreferencesUtils.readFromPref(PrefsConstants.isFingerPrintAllowedAtLogin))) {
        return showErrorWidgetDialog(
            context: context,
            title: "Biometrics Setup Needed",
            message: "You can go to your profile settings to setup your fingerprint login",
            canClick: true,
            dialogHeight: 170,
            hasBtn: true,
            btnTitle: "ok-text",
            functionToRun: () {});
      }
      if (!await startBiometricLogin()) {
        return showErrorWidgetDialog(
            context: context,
            title: "First Time Login",
            message: "You need to login at least once to activate biometrics",
            canClick: true,
            dialogHeight: 170,
            hasBtn: true,
            btnTitle: "ok-text",
            functionToRun: () {});
      } else if (!await getBiometricsSupport()) {
        return showErrorWidgetDialog(
            context: context,
            title: "Biometrics not supported",
            message: "Your device does not support fingerprint authentication",
            canClick: true,
            dialogHeight: 170,
            hasBtn: true,
            btnTitle: "ok-text",
            functionToRun: () {});
      } else if (await authenticateMe()) {
        if (callBack != null) {
          callBack();
        }
      } else {
        return showErrorWidgetDialog(
            context: context,
            title: "Unknown Error",
            message: "An unknown error occurred while trying to authenticate you",
            canClick: true,
            dialogHeight: 170,
            hasBtn: true,
            btnTitle: "ok-text",
            functionToRun: () {});
      }
    } catch (e) {
      "biofaail1 ${e.toString()}".logger();

      return showErrorWidgetDialog(
          context: context,
          title: "unknown-error-text",
          message: "biometrics-unknown-error-desc-text",
          canClick: true,
          dialogHeight: 170,
          hasBtn: true,
          btnTitle: "ok-text",
          functionToRun: () {});
    }
  }
}