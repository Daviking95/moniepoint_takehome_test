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
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.login);
    }
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