part of 'package:peerlendly/modules/authentication/complete_account_setup/exports.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  final String bvnValue;
  final String phoneNumber;

  const VerifyPhoneNumberScreen(this.bvnValue, this.phoneNumber, {Key? key})
      : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    final completeAccountWatcher =
        context.watch<CompleteAccountSetupProvider>();

    return AppBaseWidget(
      iconSet: Container(),
      buildWidget: PLOverlayLoader(
        startLoader: completeAccountWatcher.isLoading,
        loadingString: completeAccountWatcher.loadingString,
        child: VerifyPhoneWidget(
            completeAccountWatcher: completeAccountWatcher,
            bvn: widget.bvnValue,
            phoneNumber: widget.phoneNumber),
      ),
      topHeight: 80.h,
    );
  }
}

class VerifyPhoneWidget extends StatefulWidget {
  final CompleteAccountSetupProvider completeAccountWatcher;
  final String bvn;
  final String phoneNumber;

  const VerifyPhoneWidget({
    super.key,
    required this.completeAccountWatcher,
    required this.bvn,
    required this.phoneNumber,
  });

  @override
  State<VerifyPhoneWidget> createState() => _VerifyPhoneWidgetState();
}

class _VerifyPhoneWidgetState extends State<VerifyPhoneWidget> {
  TextEditingController otp = TextEditingController();

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
              child: Form(
                key: widget.completeAccountWatcher.phoneNumberVerifyFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PLVSpace(32),
                      PLBackIcon(
                        onTap: () => Navigator.pop(context),
                        isCancel: true,
                      ),
                      PLVSpace(40),
                      PLTextWidget(
                        title: "Phone Verification",
                        isTitle: true,
                        textStyle: PLTypography.textHeadlineMediumStyle,
                        textSize: PLTypography.fontHeadlineSmall,
                      ),
                      PLVSpace(5),
                      PLTextWidget(
                        title: "Please enter the 4-digit code send to you at",
                        textColor: PLColors.appPrimaryText,
                        textSize: PLTypography.fontLabelMedium,
                      ),
                      PLVSpace(4),
                      PLTextWidget(
                        title: widget.phoneNumber,
                        textColor: PLColors.appPrimaryText,
                        fontWeight: FontWeight.w700,
                        textSize: PLTypography.fontLabelMedium,
                      ),
                      PLVSpace(62),
                      SizedBox(
                        width: context.width,
                        child: PinTextField(
                          obscureText: false,
                          fieldCount: 4,
                          controller: otp,
                          onChange: (value) {
                            // model.checkIfPhoneNumberOtpisFilled();
                            if (value.length == 4) {
                              widget.completeAccountWatcher
                                  .validatePhoneNumberForm(
                                context,
                                otp,
                              );
                            }
                          },
                          validation: (val) =>
                              val.validateString(strFieldRequiredError),
                        ),
                      ),
                      PLVSpace(32),
                      ResentOtpWidget(context, () {
                        widget.completeAccountWatcher
                            .validateBvnForm(context, widget.bvn, true);
                      }, () {}),
                      PLVSpace(16),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
