part of 'package:nova/modules/authentication/signup/exports.dart';

class SignupProvider extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;

  SignupProvider({this.context, this.shouldInitialize = false});

  @override
  FutureOr<void> initState() {
    "initState WalletProvider Called".logger();

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

    email = TextEditingController();
    username = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    phoneNumber = TextEditingController();

    // email.text = "dav@gmail.com";
    // firstName.text = "dave";
    // lastName.text = "dev";
    // phoneNumber.text = "08072727273";

    referralCode = TextEditingController();
    password = TextEditingController();

    _isFormValidated = false;
  }

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController bvn = TextEditingController();
  TextEditingController novaAccountNumber = TextEditingController();
  TextEditingController accountType = TextEditingController();
  TextEditingController emailOtpCode = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController referralCode = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController setQuestion1 = TextEditingController();
  TextEditingController setQuestion2 = TextEditingController();
  TextEditingController setQuestion3 = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController transactionPin = TextEditingController();

  GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();

  bool _isFormValidated = false;
  bool _isSignupFormValidated = false;
  bool _isEmailVerifyFormValidated = false;
  bool _isSecQuestionFormValidated = false;
  bool _isDetailsSetupFormValidated = false;

  bool get isDetailsSetupFormValidated => _isDetailsSetupFormValidated;

  set isDetailsSetupFormValidated(bool value) {
    _isDetailsSetupFormValidated = value;
    notifyListeners();
  }

  bool get isSecQuestionFormValidated => _isSecQuestionFormValidated;

  set isSecQuestionFormValidated(bool value) {
    _isSecQuestionFormValidated = value;
    notifyListeners();
  }

  bool get isEmailVerifyFormValidated => _isEmailVerifyFormValidated;

  set isEmailVerifyFormValidated(bool value) {
    _isEmailVerifyFormValidated = value;
    notifyListeners();
  }

  bool get isSignupFormValidated => _isSignupFormValidated;

  set isSignupFormValidated(bool value) {
    _isSignupFormValidated = value;
    notifyListeners();
  }

  bool get isFormValidated => _isFormValidated;

  set isFormValidated(bool value) {
    _isFormValidated = value;
    notifyListeners();
  }

  User? _googleUserData;

  User? get googleUserData => _googleUserData;

  set googleUserData(User? value) {
    _googleUserData = value;
    notifyListeners();
  }

  signupNewAccount(BuildContext context) async {
    AppNavigator.push(const VerifyEmailAddressScreen());
    return;

    if (formKeyEmail.currentState!.validate()) {
      await changeLoaderStatus(true, "Confirming email");
      notifyListeners();

      final dartz.Either<ErrorResponseModel, GenericResponseModel>
          responseData = await PLSignupRepository.instance
              .confirmEmailDoesNotExistService(email.text);

      "responseDataSignUp $responseData".logger();

      return responseData.fold((errorResponse) async {
        showSnackAtTheTop(
          message: errorResponse.message,
        );

        await changeLoaderStatus(false, "");
        notifyListeners();

        return;
      }, (successResponse) async {
        if (successResponse.message == "Email Already exist") {
          showSnackAtTheTop(message: successResponse.message);
          await changeLoaderStatus(false, "");
          return;
        }
        // showSnackAtTheTop(message: successResponse.message, isSuccess: true);
        // await changeLoaderStatus(false, "");

      });
    }
  }

  signupExistingAccount(BuildContext context) async {
    AppNavigator.push(const VerifyEmailAddressForExistingCustomerScreen());
    return;

    if (formKeyEmail.currentState!.validate()) {
      await changeLoaderStatus(true, "Confirming email");
      notifyListeners();

      final dartz.Either<ErrorResponseModel, GenericResponseModel>
          responseData = await PLSignupRepository.instance
              .confirmEmailDoesNotExistService(email.text);

      "responseDataSignUp $responseData".logger();

      return responseData.fold((errorResponse) async {
        showSnackAtTheTop(
          message: errorResponse.message,
        );

        await changeLoaderStatus(false, "");
        notifyListeners();

        return;
      }, (successResponse) async {
        if (successResponse.message == "Email Already exist") {
          showSnackAtTheTop(message: successResponse.message);
          await changeLoaderStatus(false, "");
          return;
        }
        // showSnackAtTheTop(message: successResponse.message, isSuccess: true);
        // await changeLoaderStatus(false, "");

      });
    }
  }

  verifyEmailAddress(BuildContext context) async {
    AppNavigator.push(const SetSecurityQuestionScreen());
    return;

    if (formKeyEmail.currentState!.validate()) {
      await changeLoaderStatus(true, "Creating account");
      notifyListeners();

      final dartz.Either<ErrorResponseModel, GenericResponseModel>
          responseData =
          await PLSignupRepository.instance.getOtpService(email.text);

      "responseDataSignUp $responseData".logger();

      return responseData.fold((errorResponse) async {
        showSnackAtTheTop(
          message: errorResponse.message,
        );

        await changeLoaderStatus(false, "");
        notifyListeners();

        return;
      }, (successResponse) async {
        // if(successResponse.is)
        showSnackAtTheTop(message: successResponse.message, isSuccess: true);

        AppNavigator.push(VerifyEmailAddressScreen(emailAddress: email.text));

        // Navigator.pushNamed(context, AppRoutes.verifyEmailAddress);

        await changeLoaderStatus(false, "");
      });
    }
  }

  verifyEmailAddressForExistingCustomer(BuildContext context, bool isForgotPassword) async {
    isForgotPassword ? AppNavigator.push(const CreateNewPasswordScreen()) : AppNavigator.push(const SetupDetailsScreen(isExisting: true));
    return;

    if (formKeyEmail.currentState!.validate()) {
      await changeLoaderStatus(true, "Creating account");
      notifyListeners();

      final dartz.Either<ErrorResponseModel, GenericResponseModel>
          responseData =
          await PLSignupRepository.instance.getOtpService(email.text);

      "responseDataSignUp $responseData".logger();

      return responseData.fold((errorResponse) async {
        showSnackAtTheTop(
          message: errorResponse.message,
        );

        await changeLoaderStatus(false, "");
        notifyListeners();

        return;
      }, (successResponse) async {
        // if(successResponse.is)
        showSnackAtTheTop(message: successResponse.message, isSuccess: true);

        AppNavigator.push(VerifyEmailAddressScreen(emailAddress: email.text));

        // Navigator.pushNamed(context, AppRoutes.verifyEmailAddress);

        await changeLoaderStatus(false, "");
      });
    }
  }

  setSecurityQuestions(BuildContext context) async {
    AppNavigator.push(const SetupDetailsScreen());
    return;

    if (formKeyEmail.currentState!.validate()) {
      await changeLoaderStatus(true, "Creating account");
      notifyListeners();

      final dartz.Either<ErrorResponseModel, GenericResponseModel>
          responseData =
          await PLSignupRepository.instance.getOtpService(email.text);

      "responseDataSignUp $responseData".logger();

      return responseData.fold((errorResponse) async {
        showSnackAtTheTop(
          message: errorResponse.message,
        );

        await changeLoaderStatus(false, "");
        notifyListeners();

        return;
      }, (successResponse) async {
        // if(successResponse.is)
        showSnackAtTheTop(message: successResponse.message, isSuccess: true);

        AppNavigator.push(VerifyEmailAddressScreen(emailAddress: email.text));

        // Navigator.pushNamed(context, AppRoutes.verifyEmailAddress);

        await changeLoaderStatus(false, "");
      });
    }
  }

  openNovaAccount(BuildContext context, bool isExisting) async {
    AppNavigator.push( NovaSuccessScreen(
      imgPath: isExisting ? NovaAssets.existingAccountOpenSuccess : NovaAssets.accountOpenSuccess,
      titleText: isExisting ? "All Done" : "Congratulations!",
      onPressed: () {
        AppNavigator.pushAndRemoveUtil(LoginScreen());
      },
      buttonTitle: "Login",
      description: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: "Your Nova account has been created Your Account number is ",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: NovaTypography.fontLabelLarge,
                    fontFamily:
                    NovaTypography.fontFamilyLight)),
            TextSpan(
              text: "1112938444",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: NovaTypography.fontTitleMedium,
                  color: NovaColors.appPrimaryColorMain500),
            ),
          ],
        ),
        textAlign: TextAlign.center,
        softWrap: true,
        maxLines: 2,
      ),
    ));
    return;

    if (formKeyEmail.currentState!.validate()) {
      await changeLoaderStatus(true, "Creating account");
      notifyListeners();

      final dartz.Either<ErrorResponseModel, GenericResponseModel>
          responseData =
          await PLSignupRepository.instance.getOtpService(email.text);

      "responseDataSignUp $responseData".logger();

      return responseData.fold((errorResponse) async {
        showSnackAtTheTop(
          message: errorResponse.message,
        );

        await changeLoaderStatus(false, "");
        notifyListeners();

        return;
      }, (successResponse) async {
        // if(successResponse.is)
        showSnackAtTheTop(message: successResponse.message, isSuccess: true);

        AppNavigator.push(VerifyEmailAddressScreen(emailAddress: email.text));

        // Navigator.pushNamed(context, AppRoutes.verifyEmailAddress);

        await changeLoaderStatus(false, "");
      });
    }
  }

  void listenForEmailVerifyChanges() {
    if (emailOtpCode.text.isNotEmpty && emailOtpCode.text.length == 6) {
      _isEmailVerifyFormValidated = true;
    } else {
      _isEmailVerifyFormValidated = false;
    }

    notifyListeners();
  }

  void listenForDetailsSetupChanges() {
    if (
    username.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty &&
        transactionPin.text.isNotEmpty
    ) {
      _isDetailsSetupFormValidated = true;
    } else {
      _isDetailsSetupFormValidated = false;
    }

    notifyListeners();
  }

  void listenForSignupChanges() {
    if (firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty &&
        bvn.text.isNotEmpty &&
        accountType.text.isNotEmpty &&
        dateOfBirth.text.isNotEmpty) {
      _isSignupFormValidated = true;
    } else {
      _isSignupFormValidated = false;
    }

    notifyListeners();
  }

  void listenForExistingAccountChanges() {
    if (novaAccountNumber.text.isNotEmpty &&
        bvn.text.isNotEmpty &&
        dateOfBirth.text.isNotEmpty) {
      _isSignupFormValidated = true;
    } else {
      _isSignupFormValidated = false;
    }

    notifyListeners();
  }

  void listenForSecurityQuestionChanges() {
    if (setQuestion1.text.isNotEmpty
    // &&
        // setQuestion2.text.isNotEmpty &&
        // setQuestion3.text.isNotEmpty &&
    ) {
      _isSecQuestionFormValidated = true;
    } else {
      _isSecQuestionFormValidated = false;
    }

    notifyListeners();
  }

}
