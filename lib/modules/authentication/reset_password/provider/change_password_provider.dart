part of 'package:nova/modules/authentication/reset_password/exports.dart';

class ChangePasswordProvider  extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;

  ChangePasswordProvider({this.context, this.shouldInitialize = false});

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

    password = TextEditingController();
    confirmPassword = TextEditingController();

    _isFormValidated = false;
  }

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  bool _isFormValidated = false;

  bool get isFormValidated => _isFormValidated;

  set isFormValidated(bool value) {
    _isFormValidated = value;
    notifyListeners();
  }


  validateForm(BuildContext context) {
    AppNavigator.push( NovaSuccessScreen(
      imgPath: NovaAssets.existingAccountOpenSuccess,
      titleText: "All Done",
      onPressed: () {
        AppNavigator.pushAndRemoveUtil(LoginScreen());
      },
      buttonTitle: "Login",
      description: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: "Your password has been changed. Please login with your new details ",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: NovaTypography.fontLabelLarge,
                    fontFamily:
                    NovaTypography.fontFamilyLight)),
          ],
        ),
        textAlign: TextAlign.center,
        softWrap: true,
        maxLines: 2,
      ),
    ));

  }

  void listenForChanges() {
    if (password.text.isNotEmpty && confirmPassword.text.isNotEmpty && formKey.currentState!.validate() ) {
      _isFormValidated = true;
    } else {
      _isFormValidated = false;
    }

    notifyListeners();
  }
}