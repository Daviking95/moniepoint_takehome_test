part of 'package:peerlendly/modules/authentication/login/exports.dart';

class LoginProvider extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;

  LoginProvider({this.context, this.shouldInitialize = false});

  @override
  FutureOr<void> initState() {
    "initState LoginProvider Called".logger();

    if (shouldInitialize) {
      init();
    }
  }

  @override
  FutureOr<void> disposeState() {
    throw UnimplementedError();
  }

  init() {
    "init Called".logger();

    username = TextEditingController();
    password = TextEditingController();

    _isFormValidated = false;
  }

  TextEditingController username = TextEditingController();
  TextEditingController switchAccountEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  // TextEditingController activityPin = TextEditingController();
  TextEditingController otp = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySwitchAccount = GlobalKey<FormState>();

  List _loginDetails = [];

  bool _isFingerprintAllowed = false;

  bool get isFingerprintAllowed => _isFingerprintAllowed;

  set isFingerprintAllowed(bool value) {
    _isFingerprintAllowed = value;
    notifyListeners();
  }

  List get loginDetails => _loginDetails;

  set loginDetails(List value) {
    _loginDetails = value;
    notifyListeners();
  }

  bool _startLoader = false;

  bool get startLoader => _startLoader;

  set startLoader(bool value) {
    _startLoader = value;
    notifyListeners();
  }

  User? _googleUserData;

  User? get googleUserData => _googleUserData;

  set googleUserData(User? value) {
    _googleUserData = value;
    notifyListeners();
  }

  bool _isFormValidated = false;

  bool get isFormValidated => _isFormValidated;

  set isFormValidated(bool value) {
    _isFormValidated = value;
    notifyListeners();
  }

  bool _isEmailFormValidated = false;

  bool get isEmailFormValidated => _isEmailFormValidated;

  set isEmailFormValidated(bool value) {
    _isEmailFormValidated = value;
    notifyListeners();
  }

  bool checkIfFormIsValidated() {
    if (formKey.currentState!.validate()) {
      isFormValidated = true;
    } else {
      isFormValidated = false;
    }
    return isFormValidated;
  }

  validateLoginForm(BuildContext context, [TextEditingController? activityPin]) async {
    await changeLoaderStatus(true, "Validating account");
    notifyListeners();

    String emailAddress = "";

    if (AppPreferences.returnDetails.isNotEmpty) {
      emailAddress = AppPreferences.returnDetails ?? "";
    }

    "emailAddress $emailAddress".log();

    LoginRequestModel loginRequestModel = LoginRequestModel(
        emailAddress: emailAddress, securityPin: AppPreferences.activityPin.isNotEmpty ? AppPreferences.activityPin : (activityPin?.text ?? ""));

    final dartz.Either<ErrorResponseModel, GenericResponseModel>
    responseData =
    await PLLoginRepository.instance.loginService(loginRequestModel);

    "responseDataLogin $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message, isSuccess: true);

      AppPreferences.isReturningCustomer = true;
      AppPreferences.userHasActivityPin = true;
      AppPreferences.isFingerPrintAllowedAtLogin = true;
      AppPreferences.returnDetails = emailAddress;
      AppPreferences.activityPin = activityPin?.text ?? "";

      loginConditions();

      await changeLoaderStatus(false, "");
      notifyListeners();
    });
  }

  validateSwitchAccountForm(BuildContext context) async {
    await changeLoaderStatus(true, "Sending OTP");
    notifyListeners();

    final dartz.Either<ErrorResponseModel, GenericResponseModel>
    responseData =
    await PLSignupRepository.instance.getOtpService(switchAccountEmail.text);

    "responseDataSwitchAccount $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      // showSnackAtTheTop(message: successResponse.message, isSuccess: true);

      AppNavigator.push(
          SwitchAccountVerifyOtpScreen(email: switchAccountEmail.text,));

      await changeLoaderStatus(false, "");
    });
  }

  verifySwitchAccountForm(BuildContext context, String email, String otp,
      String activityPin) async {
    await changeLoaderStatus(true, "Validating account");
    notifyListeners();

    SwitchAccountRequestModel switchAccountRequestModel = SwitchAccountRequestModel(
        securityPin: activityPin, emailAddress: email, otpCode: otp);

    final dartz.Either<ErrorResponseModel, GenericResponseModel>
    responseData =
    await PLLoginRepository.instance.switchAccountService(
        switchAccountRequestModel);

    "responseDataVerifySwitchAccount $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      showSnackAtTheTop(message: successResponse.message, isSuccess: true);

      AppPreferences.isReturningCustomer = true;
      AppPreferences.returnDetails = email;
      loginConditions();

      await changeLoaderStatus(false, "");
    });
  }

  void loginConditions() {
    // if (!AppPreferences.userHasActivityPin) {
    //   AppNavigator.push(const SetActivityPinScreen());
    // } else
      if (!AppPreferences.userHasWatchedTutorial) {
      AppNavigator.push(const AppTutorialScreen());
    } else {
      AppNavigator.push(const PersistentTab());
    }
  }

  void listenForChanges() {
    checkIfFormIsValidated();
  }

  void listenForEmailChanges() {
    if (switchAccountEmail.text.isNotEmpty &&
        formKeySwitchAccount.currentState!.validate()) {
      _isEmailFormValidated = true;
    } else {
      _isEmailFormValidated = false;
    }

    notifyListeners();
  }

  startBiometricAuth(BuildContext context) {
    if (!startLoader) {
      final biometricsWatcher =
      Provider.of<BiometricProvider>(context, listen: false);

      biometricsWatcher.authenticateBiometrics(context, () {
        loginWithBiometrics(context);
      });
    }
  }

  loginWithBiometrics(BuildContext context) {
    if (AppPreferences.returnDetails.isEmpty) {
      AppPreferencesUtils.removePref(PrefsConstants.biometricTransaction);

      return showErrorWidgetDialog(
          context: context,
          title: "biometrics-first-time-text".i18n(),
          message: "biometrics-first-time-desc-text".i18n(),
          canClick: true,
          dialogHeight: 170,
          hasBtn: true,
          btnTitle: "ok-text".i18n(),
          functionToRun: () {});
    }

    validateLoginForm(context);
  }

  shouldShowFingerprint() async {
    return isFingerprintAllowed;
  }
}
