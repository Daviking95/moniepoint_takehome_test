part of 'package:nova/modules/authentication/complete_account_setup/exports.dart';

class CompleteAccountSetupProvider extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;

  CompleteAccountSetupProvider({this.context, this.shouldInitialize = false});

  @override
  FutureOr<void> initState() {
    "initState WalletProvider Called".logger();

    if (shouldInitialize) {
      // init();
    }
  }

  @override
  FutureOr<void> disposeState() {
    throw UnimplementedError();
  }

  TextEditingController email = TextEditingController();
  TextEditingController bvn = TextEditingController();
  TextEditingController _meansOfId = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController idImageDocument = TextEditingController();
  TextEditingController signatureImageDocument = TextEditingController();

  XFile _bvnImage = XFile("");
  XFile _idDocImage = XFile("");
  XFile _signatureDocImage = XFile("");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> bvnValidationFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> activityPinFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneNumberVerifyFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> verifyIDFormKey = GlobalKey<FormState>();

  TextEditingController get meansOfId => _meansOfId;

  set meansOfId(TextEditingController value) {
    _meansOfId = value;
    notifyListeners();
  }

  bool _isFormValidated = false;
  bool _isEmailAddressVerifyFormValidated = false;
  bool _isBvnFormValidated = false;
  bool _isActivityPinFormValidated = false;
  bool _isPhoneNumberVerifyFormValidated = false;
  bool _isDocumentFormValidated = false;

  bool get isDocumentFormValidated => _isDocumentFormValidated;

  set isDocumentFormValidated(bool value) {
    _isDocumentFormValidated = value;
    notifyListeners();
  }

  bool get isPhoneNumberVerifyFormValidated =>
      _isPhoneNumberVerifyFormValidated;

  set isPhoneNumberVerifyFormValidated(bool value) {
    _isPhoneNumberVerifyFormValidated = value;
    notifyListeners();
  }

  bool get isActivityPinFormValidated => _isActivityPinFormValidated;

  set isActivityPinFormValidated(bool value) {
    _isActivityPinFormValidated = value;
    notifyListeners();
  }

  bool get isFormValidated => _isFormValidated;

  set isFormValidated(bool value) {
    _isFormValidated = value;
    notifyListeners();
  }

  bool get isEmailAddressVerifyFormValidated =>
      _isEmailAddressVerifyFormValidated;

  set isEmailAddressVerifyFormValidated(bool value) {
    _isEmailAddressVerifyFormValidated = value;
    notifyListeners();
  }

  bool get isBvnFormValidated => _isBvnFormValidated;

  set isBvnFormValidated(bool value) {
    _isBvnFormValidated = value;
    notifyListeners();
  }

  XFile get signatureDocImage => _signatureDocImage;

  set signatureDocImage(XFile value) {
    _signatureDocImage = value;
    notifyListeners();
  }

  XFile get idDocImage => _idDocImage;

  set idDocImage(XFile value) {
    _idDocImage = value;
    notifyListeners();
  }

  XFile get bvnImage => _bvnImage;

  set bvnImage(XFile value) {
    _bvnImage = value;
    notifyListeners();
  }

  void listenforChanges() {
    checkIfFormIsValidated();
  }

  bool checkIfFormIsValidated() {
    if (formKey.currentState!.validate()) {
      isFormValidated = true;
    } else {
      isFormValidated = false;
    }
    return isFormValidated;
  }

  validateForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.verifyEmailAddress);
    }
  }

  validateBvnForm(BuildContext context, String bvnValue,
      [bool isResend = false]) async {
    if (bvnValidationFormKey.currentState!.validate()) {
      await changeLoaderStatus(true, "Verifying details");
      notifyListeners();

      final dartz.Either<ErrorResponseModel, VerifyBvnResponseModel>
          responseData =
          await PLSignupRepository.instance.verifyBvnService(bvnValue);

      "responseDataValidateBVN $responseData".logger();

      return responseData.fold((errorResponse) async {
        showSnackAtTheTop(
          message: errorResponse.message,
        );

        await changeLoaderStatus(false, "");
        notifyListeners();

        return;
      }, (successResponse) async {
        showSnackAtTheTop(
            message: successResponse.message ?? "", isSuccess: true);

        if (!isResend) {
          AppNavigator.push(
              VerifyPhoneNumberScreen(bvnValue, successResponse.phoneNumber));
        }

        await changeLoaderStatus(false, "");
      });
    }
  }

  checkIfActivityPinIsFilled(TextEditingController activityPin) {
    if (activityPinFormKey.currentState!.validate() &&
        activityPin.text.length == 4) {
      isActivityPinFormValidated = true;
    } else {
      isActivityPinFormValidated = false;
    }
    return isActivityPinFormValidated;
  }

  checkIfBvnFieldIsFilled() {
    if (bvnValidationFormKey.currentState!.validate() &&
        bvn.text.length == 11) {
      isBvnFormValidated = true;
    } else {
      isBvnFormValidated = false;
    }
    return isBvnFormValidated;
  }

  checkIfDocumentFormIsFilled() {
    if (meansOfId.text.isNotEmpty &&
        idNumber.text.isNotEmpty &&
        idImageDocument.text.isNotEmpty &&
        signatureImageDocument.text.isNotEmpty &&
        verifyIDFormKey.currentState!.validate()) {
      _isDocumentFormValidated = true;
    } else {
      _isDocumentFormValidated = false;
    }

    notifyListeners();
  }

  validatePhoneNumberForm(
      BuildContext context, TextEditingController otp) async {
    AppNavigator.push(BvnImageCapture(
      otp: otp.text,
    ));
  }

  validateEmailVerifyForm(
      BuildContext context, String otp, String emailAddress) async {
    AppNavigator.push(
        SetActivityPinScreen(otp: otp, emailAddress: emailAddress));

    // await changeLoaderStatus(true, "Verifying your email");
    // notifyListeners();

    // Future.delayed(const Duration(seconds: 3), () async {
    //   showSnackAtTheTop(
    //       message: "Your email address has been verified", isSuccess: true);
    //   await changeLoaderStatus(false, "");
    //
    //   AppPreferences.isUserEmailVerified = true;
    //
    //   AppNavigator.push(const SetActivityPinScreen());
    // });
  }

  validateBvnDataForm(BuildContext context, String otp) {
    if (bvnImage.path.isEmpty) {
      return showErrorWidgetDialog(
        context: context,
        title: strSuccess,
        message: "You need to take a photo",
        canClick: true,
        btnTitle: "ok-text",
      );
    } else {
      File file = File(bvnImage.path);
      String base64Image = base64Encode(file.readAsBytesSync());

      AppNavigator.push(VerifyIdScreen(otp, base64Image));
    }
  }

  validateActivityPinSetupForm(BuildContext context, String otp,
      String emailAddress, TextEditingController activityPin) async {
    await changeLoaderStatus(true, "Setting pin");
    notifyListeners();

    OnboardCustomerRequestModel onboardCustomerRequestModel =
        OnboardCustomerRequestModel(
            emailAddress: emailAddress,
            otp: otp,
            pin: activityPin.text,
            confirmPin: activityPin.text);

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLSignupRepository.instance
            .onboardCustomerService(onboardCustomerRequestModel);

    "responseDataSignUp $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      if (!successResponse.success)
        return showSnackAtTheTop(
            message: successResponse.message, isSuccess: true);

      AppPreferences.userHasActivityPin = true;
      AppPreferences.isReturningCustomer = true;
      AppPreferences.returnDetails = emailAddress;

      // AppNavigator.push(SuccessWidget(
      //   navigateToWidgetOnDone: const AppTutorialScreen(),
      //   message: successResponse.message,
      // ));

      await changeLoaderStatus(false, "");
    });
  }

  validateIDValidationForm(
      BuildContext context, String otp, String base64image) async {
    await changeLoaderStatus(true, "Validating documents");
    notifyListeners();

    File file = File(idDocImage.path);
    String base64DocImage = base64Encode(file.readAsBytesSync());

    VerifyCustomerDetailsRequestModel verifyCustomerDetailsRequestModel =
        VerifyCustomerDetailsRequestModel(
            otp: otp,
            customerImage: base64image,
            meansOfId: AppData.meansOfId.indexWhere(
                    (element) => element.values.first == meansOfId.text) +
                1,
            idNumber: idNumber.text,
            idImage: base64DocImage);

    final dartz.Either<ErrorResponseModel, GenericResponseModel> responseData =
        await PLSignupRepository.instance
            .verifyCustomerDetailsService(verifyCustomerDetailsRequestModel);

    "responseDataIDValidation $responseData".logger();

    return responseData.fold((errorResponse) async {
      showSnackAtTheTop(
        message: errorResponse.message,
      );

      await changeLoaderStatus(false, "");
      notifyListeners();

      return;
    }, (successResponse) async {
      showSnackAtTheTop(message: successResponse.message, isSuccess: true);

      AppPreferences.isUserDocumentVerified = true;
      AppPreferences.isUserPhotoTaken = true;
      AppPreferences.isUserBvnVerified = true;

      AppNavigator.push(const SuccessWidget(
        primaryBtnText: "Proceed To Dashboard",
        hasPrimaryBtn: true,
        navigateToWidgetOnDone: PersistentTab(),
        message: "Congrats!!!. Your account has been verified",
      ));

      await changeLoaderStatus(false, "");
    });
  }
}
