part of 'package:peerlendly/modules/authentication/signup/exports.dart';

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
  TextEditingController referralCode = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();

  bool _isFormValidated = false;

  bool _isEmailFormValidated = false;

  bool get isEmailFormValidated => _isEmailFormValidated;

  set isEmailFormValidated(bool value) {
    _isEmailFormValidated = value;
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

  validateForm(BuildContext context) async {
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
        showSnackAtTheTop(message: successResponse.message, isSuccess: true);

        AppNavigator.push( VerifyEmailAddress(emailAddress: email.text));

        // Navigator.pushNamed(context, AppRoutes.verifyEmailAddress);

        await changeLoaderStatus(false, "");
      });
    }
  }

  void listenForChanges() {
    if (username.text.isNotEmpty &&
        firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty &&
        password.text.isNotEmpty &&
        formKeyEmail.currentState!.validate()) {
      _isFormValidated = true;
    } else {
      _isFormValidated = false;
    }

    notifyListeners();
  }

  void listenForEmailChanges() {
    if (email.text.isNotEmpty && formKeyEmail.currentState!.validate()) {
      _isEmailFormValidated = true;
    } else {
      _isEmailFormValidated = false;
    }

    notifyListeners();
  }
}
