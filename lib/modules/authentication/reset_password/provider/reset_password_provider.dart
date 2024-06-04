part of 'package:nova/modules/authentication/reset_password/exports.dart';

class ResetPasswordProvider extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;

  ResetPasswordProvider({this.context, this.shouldInitialize = false});

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

    otp = TextEditingController();
  }

  TextEditingController otp = TextEditingController();


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isFormValidated = false;

  bool get isFormValidated => _isFormValidated;

  set isFormValidated(bool value) {
    _isFormValidated = value;
    notifyListeners();
  }

  bool checkIfFormIsValidated(TextEditingController otp) {
    if (formKey.currentState!.validate() && otp.text.length == 4) {
      isFormValidated = true;
    } else {
      isFormValidated = false;
    }
    return isFormValidated;
  }

  validateForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.activityPin);
    }
  }

  void listenForChanges() {
    if (otp.text.length == 4 && formKey.currentState!.validate()) {
      _isFormValidated = true;
    } else {
      _isFormValidated = false;
    }

    notifyListeners();
  }
}
