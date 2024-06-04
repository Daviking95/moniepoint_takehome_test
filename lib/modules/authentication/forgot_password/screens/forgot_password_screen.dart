part of 'package:nova/modules/authentication/forgot_password/exports.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordProvider>(
      vmBuilder: (context) => ForgotPasswordProvider(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, ForgotPasswordProvider model) {
    return AppBaseWidget(
      iconSet: NovaImagePng(
        imgPath: NovaAssets.phoneWalletInHand,
        width: 150.w,
        height: 150.h,
        boxFit: BoxFit.contain,
      ),
      buildWidget: ForgotPasswordWidget(model: model),
      hasBackButton: true,
      topHeight: 200.h,
    );

  }
}

class ForgotPasswordWidget extends StatelessWidget {
  final ForgotPasswordProvider model;

  const ForgotPasswordWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: SingleChildScrollView(
              child: Form(
                key: model.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaVSpace(40),
                    NovaTextWidget(
                      title: "Recover PIN",
                      isTitle: true,
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontHeadlineMedium,
                    ),
                    NovaVSpace(10),
                    NovaTextWidget(
                      title: "Enter your email and we’ll send you a link to reset your PIN.",
                      textColor: NovaColors.appGrayText,
                      textSize: NovaTypography.fontLabelMedium,
                    ),
                    NovaVSpace(32),
                    NovaPrimaryTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: model.email,
                      onChange: (val) => model.listenForChanges(),
                      validation: (val) => val.validateEmail(strEmailError),
                      hintText: strEmail,
                    ),
                    NovaVSpace(40),
                    NovaButtonRound(
                      textTitle: "Reset",
                      isLoader: model.isLoading,
                      loadingString: model.loadingString,
                      isFormValidated: model.isFormValidated,
                      functionToRun: () => model.validateForm(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
