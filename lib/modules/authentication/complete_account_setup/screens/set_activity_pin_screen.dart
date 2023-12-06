part of 'package:peerlendly/modules/authentication/complete_account_setup/exports.dart';

class SetActivityPinScreen extends StatefulWidget {
  final bool isPinReEnter;
  final String otp;
  final String emailAddress;

  const SetActivityPinScreen(
      {Key? key,
      this.isPinReEnter = false,
      this.otp = "",
      this.emailAddress = ""})
      : super(key: key);

  @override
  State<SetActivityPinScreen> createState() => _SetActivityPinScreenState();
}

class _SetActivityPinScreenState extends State<SetActivityPinScreen> {
  TextEditingController activityPin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final completeAccountWatcher =
        context.watch<CompleteAccountSetupProvider>();

    return AppBaseWidget(
      iconSet: PLImagePng(
        imgPath: PLAssets.phoneWalletInHand,
        width: 138.w,
        height: 130.h,
        boxFit: BoxFit.contain,
      ),
      buildWidget: PLOverlayLoader(
        startLoader: completeAccountWatcher.isLoading,
        loadingString: completeAccountWatcher.loadingString,
        child: ActivityPinSetupWidget(
            completeAccountWatcher: completeAccountWatcher,
            activityPin: activityPin,
            isPinReEnter: widget.isPinReEnter,
            otp: widget.otp,
            emailAddress: widget.emailAddress),
      ),
      topHeight: 200.h,
    );
  }
}

class ActivityPinSetupWidget extends StatelessWidget {
  const ActivityPinSetupWidget(
      {super.key,
      required this.completeAccountWatcher,
      required this.activityPin,
      this.isPinReEnter = false,
      this.otp = "",
      this.emailAddress = ""});

  final CompleteAccountSetupProvider completeAccountWatcher;
  final TextEditingController activityPin;
  final bool isPinReEnter;
  final String otp;
  final String emailAddress;

  @override
  Widget build(BuildContext context) {
    "validateEmailVerifyForm $otp $emailAddress".log();
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
                          context, AppRoutes.verifyEmailAddress),
                      isCancel: true,
                      isBtmNavWithNoTitle: true,
                    ),
                    PLVSpace(40),
                    PLTextWidget(
                      title:
                          isPinReEnter ? "Re-enter New Pin" : "Enter New Pin",
                      isTitle: true,
                      textStyle: PLTypography.textHeadlineMediumStyle,
                      textSize: PLTypography.fontHeadlineSmall,
                    ),
                    PLVSpace(10),
                    PLTextWidget(
                      title: "Kindly enter your 4-digit code ",
                      textColor: PLColors.appGrayText,
                      textSize: PLTypography.fontLabelMedium,
                    ),
                    PLVSpace(60),
                    SizedBox(
                      width: context.width,
                      child: PinTextField(
                        obscureText: false,
                        fieldCount: 4,
                        controller: activityPin,
                        onChange: (value) {
                          if (value.length == 4) {
                            if (isPinReEnter) {
                              completeAccountWatcher
                                  .validateActivityPinSetupForm(
                                      context, otp, emailAddress, activityPin);
                            } else {
                              AppNavigator.push(SetActivityPinScreen(
                                isPinReEnter: true,
                                otp: otp,
                                emailAddress: emailAddress,
                              ));
                            }
                          }
                        },
                        validation: (val) =>
                            val.validateString(strFieldRequiredError),
                      ),
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
