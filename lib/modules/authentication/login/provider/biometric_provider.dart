part of 'package:peerlendly/modules/authentication/login/exports.dart';

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
          localizedReason: "biometrics-auth-desc-text".i18n(),
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
            title: "biometrics-setup-text".i18n(),
            message: "biometrics-setup-desc-text".i18n(),
            canClick: true,
            dialogHeight: 170,
            hasBtn: true,
            btnTitle: "ok-text".i18n(),
            functionToRun: () {});
      }
      if (!await startBiometricLogin()) {
        return showErrorWidgetDialog(
            context: context,
            title: "biometrics-first-time-text".i18n(),
            message: "biometrics-first-time-desc-text".i18n(),
            canClick: true,
            dialogHeight: 170,
            hasBtn: true,
            btnTitle: "ok-text".i18n(),
            functionToRun: () {});
      } else if (!await getBiometricsSupport()) {
        return showErrorWidgetDialog(
            context: context,
            title: "biometrics-not-supported-text".i18n(),
            message: "biometrics-not-supported-desc-text".i18n(),
            canClick: true,
            dialogHeight: 170,
            hasBtn: true,
            btnTitle: "ok-text".i18n(),
            functionToRun: () {});
      } else if (await authenticateMe()) {
        if (callBack != null) {
          callBack();
        }
      } else {
        return showErrorWidgetDialog(
            context: context,
            title: "unknown-error-text".i18n(),
            message: "biometrics-unknown-error-desc-text".i18n(),
            canClick: true,
            dialogHeight: 170,
            hasBtn: true,
            btnTitle: "ok-text".i18n(),
            functionToRun: () {});
      }
    } catch (e) {
      "biofaail1 ${e.toString()}".logger();

      return showErrorWidgetDialog(
          context: context,
          title: "unknown-error-text".i18n(),
          message: "biometrics-unknown-error-desc-text".i18n(),
          canClick: true,
          dialogHeight: 170,
          hasBtn: true,
          btnTitle: "ok-text".i18n(),
          functionToRun: () {});
    }
  }
}