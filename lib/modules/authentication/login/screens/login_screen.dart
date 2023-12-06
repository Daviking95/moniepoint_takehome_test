part of 'package:peerlendly/modules/authentication/login/exports.dart';

class LoginScreen extends StatelessWidget {
  final bool isSwitchAccount;
  final String otp;
  final String email;

  const LoginScreen(
      {Key? key, this.isSwitchAccount = false, this.otp = "", this.email = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      vmBuilder: (context) =>
          LoginProvider(context: context, shouldInitialize: true),
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
      buildWidget: PLOverlayLoader(
          startLoader: model.isLoading,
          loadingString: model.loadingString,
          child: LoginWidget(model, isSwitchAccount, otp, email)),
      topHeight: 250.h,
    );
  }
}

class LoginWidget extends StatefulWidget {
  final LoginProvider model;

  final bool isSwitchAccount;
  final String otp;
  final String email;

  const LoginWidget(this.model, this.isSwitchAccount, this.otp, this.email,
      {super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  TextEditingController activityPin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: Scaffold(
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
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.onboarding),
                      isCancel: true,
                      isBtmNavWithNoTitle: true,
                    ),
                    PLVSpace(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PLTextWidget(
                          title: "Security Pin",
                          isTitle: true,
                          textStyle: PLTypography.textHeadlineMediumStyle,
                          textSize: PLTypography.fontHeadlineSmall,
                        ),
                        if (AppPreferences.isFingerPrintAllowedAtLogin &&
                            AppPreferences.userHasActivityPin &&
                            AppPreferences.activityPin.isNotEmpty &&
                            AppPreferences.returnDetails.isNotEmpty &&
                            !widget.isSwitchAccount) ...[
                          GestureDetector(
                            onTap: () => widget.model.startBiometricAuth(context),
                            child: const PLImageSvg(
                              svgPath: PLAssets.biometricsIcon,
                            ),
                          )
                        ],
                      ],
                    ),
                    PLVSpace(6),
                    if (AppPreferences.returnDetails.isNotEmpty) ...[
                      PLTextWidget(
                        title: "Welcome back ${AppPreferences.returnDetails} ?",
                      ),
                      PLVSpace(6),
                    ],
                    PLTextWidget(
                      title: "Kindly enter your 4-digit code ",
                      textColor: PLColors.appGrayText,
                      textSize: PLTypography.fontLabelMedium,
                    ),
                    PLVSpace(48),
                    SizedBox(
                      width: context.width,
                      child: PinTextField(
                        obscureText: false,
                        fieldCount: 4,
                        controller: activityPin,
                        onChange: (value) {
                          if (value.length == 4) {
                            if (widget.isSwitchAccount) {
                              widget.model.verifySwitchAccountForm(
                                  context, widget.email, widget.otp, activityPin.text);
                            } else {
                              widget.model.validateLoginForm(context, activityPin);
                            }
                          }
                        },
                        validation: (val) =>
                            val.validateString(strFieldRequiredError),
                      ),
                    ),
                    PLVSpace(32),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.forgotPassword),
                      child: Center(
                        child: PLTextWidget(
                          title: strForgotPassword,
                          textColor: PLColors.appPrimaryColorMain500,
                          textSize: PLTypography.fontLabelMedium,
                        ),
                      ).paddingAll(5),
                    ),
                    PLVSpace(4),
                    GestureDetector(
                      onTap: () {
                        AppPreferences.isUserDocumentVerified = false;
                        AppPreferences.isUserPhotoTaken = false;
                        AppPreferences.isUserBvnVerified = false;
                        AppPreferences.userHasActivityPin = false;
                        AppPreferences.isReturningCustomer = false;
                        AppPreferences.userLoggedInData = "";
                        AppPreferences.bearerToken = "";
                        AppPreferences.returnDetails = "";

                        AppNavigator.push(const SwitchAccountLoginScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!widget.isSwitchAccount) ...[
                            const PLTextWidget(
                              title: "Not your account ?",
                            ),
                            PLHSpace(4),
                          ],
                          const PLTextWidget(
                            title: "Switch Account",
                            textColor: PLColors.appPrimaryColorMain500,
                          ),
                        ],
                      ).paddingAll(5),
                    ),
                    PLVSpace(14),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
