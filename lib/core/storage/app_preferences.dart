part of 'package:peerlendly/core/storage/exports.dart';

class AppPreferences {

  static late SharedPreferences _sharedPrefs;

  factory AppPreferences() => AppPreferences._internal();

  AppPreferences._internal();

  static Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  static String get returnDetails =>
      _sharedPrefs.getString(PrefsConstants.returnDetails) ?? "";

  static set returnDetails(String value) =>
      _sharedPrefs.setString(PrefsConstants.returnDetails, value);

  static String get activityPin =>
      _sharedPrefs.getString(PrefsConstants.activityPin) ?? "";

  static set activityPin(String value) =>
      _sharedPrefs.setString(PrefsConstants.activityPin, value);

  // static Future<String?> get bearerToken  async=>
  //     await AppPreferencesUtils.getFromPref(PrefsConstants.userBearerToken) ??
  //     "";
  //
  // static set bearerToken(dynamic value) =>
  //      AppPreferencesUtils.saveToPref(PrefsConstants.userBearerToken,
  //         value);

  static String get bearerToken =>
      _sharedPrefs.getString(PrefsConstants.userBearerToken) ?? "";

  static set bearerToken(String value) =>
      _sharedPrefs.setString(PrefsConstants.userBearerToken, value);

  static String get userLoggedInData =>
      _sharedPrefs.getString(PrefsConstants.userLoggedInData) ?? "";

  static set userLoggedInData(String value) =>
      _sharedPrefs.setString(PrefsConstants.userLoggedInData, value);

  static bool get isOnboardingCarouselSeenOnce =>
      _sharedPrefs.getBool(PrefsConstants.onboardingSeenOnce) ?? false;

  static set isOnboardingCarouselSeenOnce(bool value) =>
      _sharedPrefs.setBool(PrefsConstants.onboardingSeenOnce, value);

  static bool get isUserDocumentVerified =>
      _sharedPrefs.getBool(PrefsConstants.isUserDocumentVerified) ?? false;

  static set isUserDocumentVerified(bool value) =>
      _sharedPrefs.setBool(PrefsConstants.isUserDocumentVerified, value);

  static bool get isUserBvnVerified =>
      _sharedPrefs.getBool(PrefsConstants.isUserBvnVerified) ?? false;

  static set isUserBvnVerified(bool value) =>
      _sharedPrefs.setBool(PrefsConstants.isUserBvnVerified, value);

  static bool get isUserPhotoTaken =>
      _sharedPrefs.getBool(PrefsConstants.isUserPhotoTaken) ?? false;

  static set isUserPhotoTaken(bool value) =>
      _sharedPrefs.setBool(PrefsConstants.isUserPhotoTaken, value);

  static set isUserEmailVerified(bool value) =>
      _sharedPrefs.setBool(PrefsConstants.isUserEmailVerified, value);

  static bool get isUserEmailVerified =>
      _sharedPrefs.getBool(PrefsConstants.isUserEmailVerified) ?? false;

  static set userHasActivityPin(bool value) =>
      _sharedPrefs.setBool(PrefsConstants.userHasActivityPin, value);

  static bool get userHasActivityPin =>
      _sharedPrefs.getBool(PrefsConstants.userHasActivityPin) ?? false;

  static bool get userHasWatchedTutorial =>
      _sharedPrefs.getBool(PrefsConstants.userHasWatchedTutorial) ?? false;

  static set userHasWatchedTutorial(bool value) =>
      _sharedPrefs.setBool(PrefsConstants.userHasWatchedTutorial, value);

  static bool get showBalanceForCard =>
      _sharedPrefs.getBool(PrefsConstants.showBalanceForCard) ?? true;

  static set showBalanceForCard(bool value) =>
      _sharedPrefs.setBool(PrefsConstants.showBalanceForCard, value);

  static bool get isReturningCustomer =>
      _sharedPrefs.getBool(PrefsConstants.isReturningCustomer) ?? true;

  static set isReturningCustomer(bool value) =>
      _sharedPrefs.setBool(PrefsConstants.isReturningCustomer, value);

  static bool get isFingerPrintAllowedAtLogin =>
      _sharedPrefs.getBool(PrefsConstants.isFingerPrintAllowedAtLogin) ?? true;

  static set isFingerPrintAllowedAtLogin(bool value) =>
      _sharedPrefs.setBool(PrefsConstants.isFingerPrintAllowedAtLogin, value);

  static String get imageProfileFile =>
      _sharedPrefs.getString(PrefsConstants.imageProfileFile) ?? "";

  static set imageProfileFile(String value) =>
      _sharedPrefs.setString(PrefsConstants.imageProfileFile, value);

}
