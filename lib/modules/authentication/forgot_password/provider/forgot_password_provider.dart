part of 'package:nova/modules/authentication/forgot_password/exports.dart';

class ForgotPasswordProvider extends BaseViewModel {
  final BuildContext? context;
  final bool shouldInitialize;

  ForgotPasswordProvider({this.context, this.shouldInitialize = false});

  @override
  FutureOr<void> initState() {
    "initState ForgotPasswordProvider Called".logger();

    if (shouldInitialize) {
      // init();
    }
  }

  @override
  FutureOr<void> disposeState() {
    throw UnimplementedError();
  }

  TextEditingController email = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isFormValidated = false;

  bool get isFormValidated => _isFormValidated;

  set isFormValidated(bool value) {
    _isFormValidated = value;
    notifyListeners();
  }

  validateForm(BuildContext context) async{
    if (formKey.currentState!.validate()) {
      await changeLoaderStatus(true, "Processing request");
      notifyListeners();

      final dartz.Either<ErrorResponseModel, GenericResponseModel>
      responseData =
      await PLProfileRepository.instance.sendForgotPinMailService(email.text);

      "responseDataSendForgotPinMail $responseData".logger();

      return responseData.fold((errorResponse) async {
        showSnackAtTheTop(
          message: errorResponse.message,
        );

        await changeLoaderStatus(false, "");
        notifyListeners();

        return;
      }, (successResponse) async {
        // showSnackAtTheTop(message: successResponse.message ?? "", isSuccess: true);

          AppNavigator.push(SuccessWidget(
            primaryBtnText: "Open Mail",
            hasPrimaryBtn: true,
            primaryBtnFunc: (){
              openMailApps(context);
              AppNavigator.push(const LoginScreen());
            },
            message: "We have sent an email link to your email ${email.text}",
          ));

        await changeLoaderStatus(false, "");
      });
    }
  }

  void listenForChanges() {
    if (email.text.isNotEmpty && formKey.currentState!.validate()) {
      _isFormValidated = true;
    } else {
      _isFormValidated = false;
    }

    notifyListeners();
  }
}
