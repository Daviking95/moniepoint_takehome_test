part of 'package:nova/modules/authentication/complete_account_setup/exports.dart';

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

  @override
  Widget build(BuildContext context) {
    final completeAccountWatcher =
        context.watch<CompleteAccountSetupProvider>();

    return AppBaseWidget(
      iconSet: NovaImagePng(
        imgPath: NovaAssets.phoneWalletInHand,
        width: 138.w,
        height: 130.h,
        boxFit: BoxFit.contain,
      ),
      hasBackButton: true,
      buildWidget: NovaOverlayLoader(
        startLoader: completeAccountWatcher.isLoading,
        loadingString: completeAccountWatcher.loadingString,
        child: ActivityPinSetupWidget(
            completeAccountWatcher: completeAccountWatcher,
            // activityPin: activityPin,
            isPinReEnter: widget.isPinReEnter,
            otp: widget.otp,
            emailAddress: widget.emailAddress),
      ),
      topHeight: 200.h,
    );
  }
}

class ActivityPinSetupWidget extends StatefulWidget {
  const ActivityPinSetupWidget(
      {super.key,
      required this.completeAccountWatcher,
      // required this.activityPin,
      this.isPinReEnter = false,
      this.otp = "",
      this.emailAddress = ""});

  final CompleteAccountSetupProvider completeAccountWatcher;
  // final TextEditingController activityPin;
  final bool isPinReEnter;
  final String otp;
  final String emailAddress;

  @override
  State<ActivityPinSetupWidget> createState() => _ActivityPinSetupWidgetState();
}

class _ActivityPinSetupWidgetState extends State<ActivityPinSetupWidget> {

  TextEditingController activityPin = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activityPin = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    activityPin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    "validateEmailVerifyForm ${widget.otp} ${widget.emailAddress}".log();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: NovaScaffold(
          backgroundColor: NovaColors.appWhiteColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NovaVSpace(16),
                    NovaBackIcon(
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.verifyEmailAddress),
                      isCancel: true,
                      isBtmNavWithNoTitle: true,
                    ),
                    NovaVSpace(40),
                    NovaTextWidget(
                      title:
                          widget.isPinReEnter ? "Re-enter New Pin" : "Enter New Pin",
                      isTitle: true,
                      textStyle: NovaTypography.textHeadlineMediumStyle,
                      textSize: NovaTypography.fontHeadlineSmall,
                    ),
                    NovaVSpace(10),
                    NovaTextWidget(
                      title: "Kindly enter your 4-digit code ",
                      textColor: NovaColors.appGrayText,
                      textSize: NovaTypography.fontLabelMedium,
                    ),
                    NovaVSpace(60),
                    SizedBox(
                      width: context.width,
                      child: PinTextField(
                        obscureText: false,
                        fieldCount: 4,
                        controller: activityPin,
                        onChange: (value) {
                          if (value.length == 4) {
                            if (widget.isPinReEnter) {
                              widget.completeAccountWatcher
                                  .validateActivityPinSetupForm(
                                      context, widget.otp, widget.emailAddress, activityPin);
                            } else {
                              AppNavigator.push(SetActivityPinScreen(
                                isPinReEnter: true,
                                otp: widget.otp,
                                emailAddress: widget.emailAddress,
                              ));
                            }
                          }
                        },
                        validation: (val) =>
                            val.validateString(strFieldRequiredError),
                      ),
                    ),
                    NovaVSpace(14),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
