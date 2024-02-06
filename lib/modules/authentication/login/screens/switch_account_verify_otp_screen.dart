part of 'package:peerlendly/modules/authentication/login/exports.dart';

class SwitchAccountVerifyOtpScreen extends StatelessWidget {
  final String email;
  const SwitchAccountVerifyOtpScreen({Key? key, required this.email}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      vmBuilder: (context) => LoginProvider(context: context, shouldInitialize: true),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, LoginProvider model) {

    return AppBaseWidget(
      iconSet: PLImagePng(
        imgPath: PLAssets.phoneWalletInHand,
        width: 150.w,
        height: 180.h,
        boxFit: BoxFit.contain,
      ),
      hasBackButton: true,
      buildWidget: PLOverlayLoader(
          startLoader: model.isLoading,
          loadingString: model.loadingString,
          child: VerifySwitchAccountWidget(model, email)),
      topHeight: 250.h,
    );
  }
}

class VerifySwitchAccountWidget extends StatelessWidget {

  final String email;

  final LoginProvider model;
  const VerifySwitchAccountWidget(this.model, this.email, {super.key});

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: WillPopScope(
          onWillPop: () => Future.value(true),
          child: PLScaffold(
            backgroundColor: PLColors.appWhiteColor,
            body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLVSpace(16),
                      PLBackIcon(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoutes.onboarding),
                        isCancel: true,
                        isBtmNavWithNoTitle: true,
                      ),
                      PLVSpace(40),
                      PLTextWidget(
                        title: "OTP Code",
                        isTitle: true,
                        textStyle: PLTypography.textHeadlineMediumStyle,
                        textSize: PLTypography.fontHeadlineSmall,
                      ),
                      PLVSpace(10),
                      PLTextWidget(
                        title: "Kindly enter the 4-digit code sent to your email ",
                        textColor: PLColors.appGrayText,
                        textSize: PLTypography.fontLabelMedium,

                      ),
                      PLVSpace(48),
                      SizedBox(
                        width: context.width,
                        child: PinTextField(
                          obscureText: false,
                          fieldCount: 4,
                          controller: model.otp,
                          onChange: (value) {
                            if (value.length == 4) {

                              AppNavigator.push( LoginScreen(isSwitchAccount: true, otp: model.otp.text, email: email));

                              // model.verifySwitchAccountForm(context, email);
                            }
                          },
                          validation: (val) =>
                              val.validateString(strFieldRequiredError),
                        ),
                      ),
                      PLVSpace(32),
                    ],
                  ),
                )),
          ),
        ),
      );

    }
}

